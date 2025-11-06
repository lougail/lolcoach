class Participant {
  // === IDENTIFICATION ===
  final String puuid;
  final String summonerName;
  final String championName;
  final String teamPosition;
  final int champLevel;

  // === KDA ===
  final int kills;
  final int deaths;
  final int assists;

  // === FARM ===
  final int totalMinionsKilled;
  final int neutralMinionsKilled;

  // === COMBAT - Dégâts ===
  final int totalDamageDealtToChampions;
  final int physicalDamageDealt;
  final int magicDamageDealt;
  final int trueDamageDealt;

  // === COMBAT - Survivabilité ===
  final int totalDamageTaken;
  final int damageSelfMitigated;
  final int totalHeal;

  // === COMBAT - Contrôle ===
  final int timeCCingOthers;

  // === VISION ===
  final int visionScore;

  // === ECONOMIE ===
  final int goldEarned;

  // === OBJECTIFS ===
  final int turretKills;
  final int dragonKills;
  final int baronKills;

  // === MULTI-KILLS ===
  final int doubleKills;
  final int tripleKills;
  final int quadraKills;
  final int pentaKills;

  // === SPREES ===
  final int largestKillingSpree;
  final int largestMultiKill;

  // === RESULTAT ===
  final bool win;

  // === ITEMS ===
  final List<int> items;

  Participant({
    required this.puuid,
    required this.summonerName,
    required this.championName,
    required this.teamPosition,
    required this.champLevel,
    required this.kills,
    required this.deaths,
    required this.assists,
    required this.totalMinionsKilled,
    required this.neutralMinionsKilled,
    required this.totalDamageDealtToChampions,
    required this.physicalDamageDealt,
    required this.magicDamageDealt,
    required this.trueDamageDealt,
    required this.totalDamageTaken,
    required this.damageSelfMitigated,
    required this.totalHeal,
    required this.timeCCingOthers,
    required this.visionScore,
    required this.goldEarned,
    required this.turretKills,
    required this.dragonKills,
    required this.baronKills,
    required this.doubleKills,
    required this.tripleKills,
    required this.quadraKills,
    required this.pentaKills,
    required this.largestKillingSpree,
    required this.largestMultiKill,
    required this.win,
    required this.items,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      puuid: json['puuid'],
      summonerName: json['summonerName'],
      championName: json['championName'],
      teamPosition: json['teamPosition'],
      champLevel: json['champLevel'],
      kills: json['kills'],
      deaths: json['deaths'],
      assists: json['assists'],
      totalMinionsKilled: json['totalMinionsKilled'],
      neutralMinionsKilled: json['neutralMinionsKilled'],
      totalDamageDealtToChampions: json['totalDamageDealtToChampions'],
      physicalDamageDealt: json['physicalDamageDealt'],
      magicDamageDealt: json['magicDamageDealt'],
      trueDamageDealt: json['trueDamageDealt'],
      totalDamageTaken: json['totalDamageTaken'],
      damageSelfMitigated: json['damageSelfMitigated'],
      totalHeal: json['totalHeal'],
      timeCCingOthers: json['timeCCingOthers'],
      visionScore: json['visionScore'],
      goldEarned: json['goldEarned'],
      turretKills: json['turretKills'],
      dragonKills: json['dragonKills'],
      baronKills: json['baronKills'],
      doubleKills: json['doubleKills'],
      tripleKills: json['tripleKills'],
      quadraKills: json['quadraKills'],
      pentaKills: json['pentaKills'],
      largestKillingSpree: json['largestKillingSpree'],
      largestMultiKill: json['largestMultiKill'],
      win: json['win'],
      items: [
        json['item0'] ?? 0,
        json['item1'] ?? 0,
        json['item2'] ?? 0,
        json['item3'] ?? 0,
        json['item4'] ?? 0,
        json['item5'] ?? 0,
        json['item6'] ?? 0,
      ],
    );
  }
}
