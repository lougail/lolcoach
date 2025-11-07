class Summoner {
  final String? id;  // Optionnel (pas toujours retourné par l'API)
  final String puuid;
  final String? name;  // Optionnel (pas toujours retourné par l'API)
  final int profileIconId;
  final int summonerLevel;

  Summoner({
    this.id,
    required this.puuid,
    this.name,
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
