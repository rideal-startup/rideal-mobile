
import 'package:rideal/models/city.dart';

class Friend {
  Enum id;
  User friends;

  User({this.username, 
        this.name,
        this.surname,
        this.city,
        this.email,
        this.points,
        this.friends,
        this.password});

  Map<String, dynamic> toJson() {
    print("toJson");
    return {
      'username': this.username, 
      'name': this.name,
      'surname': this.surname,
      'city': this.city,
      'email': this.email,
      'password': this.password };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      name: json['name'],
      surname: json['surname'],
      city: json['city'] != null ?  City.fromJson(json['city']).name : null,
      email: json['email'],
      points: json['points'],
      friends: json['friends'].map<User>((o) { return User.fromJson(o); }).toList(),
      password: json['password']
    );
  }
}