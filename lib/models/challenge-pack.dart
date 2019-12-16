import 'package:rideal/models/challenge.dart';

class ChallengePack{
  final Challenge challenge;
  final int points;
  final int progres;
  final int start;

  ChallengePack({this.challenge, this.points, this.progres, this.start});

  factory ChallengePack.fromJson(dynamic json) {
    return ChallengePack(
      challenge: json['challenge'] != null ?  Challenge.fromJson(json['challenge']) : null,
      points: json['points'],
      progres: json['progres'],
      start: json['start'],
    );
  }
}