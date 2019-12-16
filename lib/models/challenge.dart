
import 'package:rideal/models/city.dart';
import 'package:rideal/models/user.dart';

class Challenge {
  final String id;
  final String name;
  final String description;
  final int goal;
  final String unit;
  final String difficulty;
  final int duration;
  final City city;
  final User company;
  final Prize prize;

  Challenge({this.id, this.name, this.description, this.goal, this.unit, this.difficulty, this.duration, this.city, this.company, this.prize});

  factory Challenge.fromJson(dynamic json) {
    return Challenge(
      name: json['name'],
      id: json['id'],
      description: json['description'],
      goal: json['goal'],
      unit: json['unit'],
      difficulty: json['difficulty'],
      duration: json['duration'],
      city: json['city'] != null ?  City.fromJson(json['city']) : null,
      company: json['company'] != null ?  User.fromJson(json['company']) : null,
      prize: json['prize'] != null ?  Prize.fromJson(json['prize']) : null,
    );
  }
}

class Prize{
  final String name;
  final String link;

  Prize({this.name, this.link});


  factory Prize.fromJson(dynamic json) {
    return Prize(
      name: json['name'],
      link: json['link'],
    );
  }
}



enum ChallengeDifficulty {
    GOLD,
    SILVER,
    BRONZE
}