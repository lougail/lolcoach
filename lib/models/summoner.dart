class Summoner {
  final String id;
  final String puuid;
  final String name;
  final int profileIconId;
  final int summonerLevel;

  Summoner({
    required this.id,
    required this.puuid,
    required this.name,
    required this.profileIconId,
    required this.summonerLevel,
  });

  factory Summoner.fromJson(Map<String, dynamic> json) {
    return Summoner(
      id: json['id'],
      puuid: json['puuid'],
      name: json['name'],
      profileIconId: json['profileIconId'],
      summonerLevel: json['summonerLevel'],
    );
  }
}
