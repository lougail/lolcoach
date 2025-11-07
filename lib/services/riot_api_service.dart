import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/match.dart';
import '../models/summoner.dart';

class RiotApiService {
  final String _apiKey;
  final String _baseUrl = 'https://euw1.api.riotgames.com';

  RiotApiService(this._apiKey);

  /// Récupère un joueur à partir de son Riot ID (GameName#Tag)
  /// Par exemple: getSummonerByRiotId('Rekkles', 'EUW')
  Future<Summoner> getSummonerByRiotId(String gameName, String tagLine) async {
    // Étape 1 : Récupérer le PUUID via Account-V1
    final accountUrl = Uri.parse(
      'https://europe.api.riotgames.com/riot/account/v1/accounts/by-riot-id/$gameName/$tagLine',
    );

    print('🌐 Appel Account-V1 : $accountUrl');

    final headers = {'X-Riot-Token': _apiKey};
    final accountResponse = await http.get(accountUrl, headers: headers);

    if (accountResponse.statusCode != 200) {
      throw Exception(
        'Erreur lors de la récupération du compte : ${accountResponse.statusCode}',
      );
    }

    final accountData = json.decode(accountResponse.body);
    final puuid = accountData['puuid'];
    final retrievedGameName = accountData['gameName'];  // Sauvegarder le nom

    print('✅ PUUID récupéré : ${puuid.substring(0, 10)}...');

    // Étape 2 : Récupérer les infos du summoner via Summoner-V4
    final summonerUrl = Uri.parse(
      '$_baseUrl/lol/summoner/v4/summoners/by-puuid/$puuid',
    );

    print('🌐 Appel Summoner-V4 : $summonerUrl');

    final summonerResponse = await http.get(summonerUrl, headers: headers);

    if (summonerResponse.statusCode == 200) {
      final jsonData = json.decode(summonerResponse.body);
      // Ajouter le name depuis Account-V1 car Summoner-V4 ne le retourne pas
      jsonData['name'] = retrievedGameName;
      return Summoner.fromJson(jsonData);
    } else {
      throw Exception(
        'Erreur lors de la récupération du joueur : ${summonerResponse.statusCode}',
      );
    }
  }

  Future<List<String>> getMatchHistory(String puuid, {int count = 20}) async {
    final url = Uri.parse(
      'https://europe.api.riotgames.com/lol/match/v5/matches/by-puuid/$puuid/ids?start=0&count=$count',
    );
    final headers = {
      'X-Riot-Token': _apiKey,
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final List<dynamic> matchIds = json.decode(response.body);
      return matchIds.cast<String>();
    } else {
      throw Exception(
        'Erreur lors de la récupération de l\'historique : ${response.statusCode}',
      );
    }
  }

  Future<Match> getMatchDetails(String matchId) async {
    final url = Uri.parse(
      'https://europe.api.riotgames.com/lol/match/v5/matches/$matchId',
    );
    final headers = {
      'X-Riot-Token': _apiKey,
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Match.fromJson(jsonData);
    } else {
      throw Exception(
        'Erreur lors de la récupération du match : ${response.statusCode}',
      );
    }
  }
}
