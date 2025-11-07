import 'participant.dart';

class Match {
  final String matchId;
  final DateTime gameCreation;
  final int gameDuration;
  final String gameMode;
  final List<Participant> participants;

  Match({
    required this.matchId,
    required this.gameCreation,
    required this.gameDuration,
    required this.gameMode,
    required this.participants,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      matchId: json['metadata']['matchId'],
      gameCreation: DateTime.fromMillisecondsSinceEpoch(
        json['info']['gameCreation'],
      ),
      gameDuration: json['info']['gameDuration'],
      gameMode: json['info']['gameMode'],
      participants: (json['info']['participants'] as List)
          .map((participantJson) => Participant.fromJson(participantJson))
          .toList(),
    );
  }
}
