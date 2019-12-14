import 'package:rideal/models/city.dart';

class User {
  String id;
  String username;
  String name;
  String surname;
  City city;
  String email;
  int points = 0;
  List<String> requests = [];
  List<String> friends = [];
  String password;

  User({this.id,
       this.username,
       this.name,
       this.surname,
       this.city,
       this.email,
       this.points,
       this.friends,
       this.password});

  Map<String, dynamic> toJson({bool cityToUri = true}) {
    return {
      'id': this.id,
      'username': this.username,
      'name': this.name,
      'points': this.points,
      'surname': this.surname,
      'city': cityToUri ? '/cities/' + this.city.id : this.city.toJson(),
      'email': this.email,
      'password': this.password
    };
  }

  factory User.fromJson(Map<String, dynamic> userJson) {
    User user = User();
    user.id = userJson['id'];
    user.username = userJson['username'];
    user.name = userJson['name'];
    user.surname = userJson['surname'];
    if (userJson.containsKey('city'))
      user.city = City.fromJson(userJson['city']);
    user.email = userJson['email'];
    user.points = userJson['points'];
    user.friends = userJson.containsKey('friends') ? userJson['friends'].cast<String>() : <String>[];
    user.requests = userJson.containsKey('requests') ? userJson['requests'].cast<String>() : <String>[];

        // .map<User>((friend) => User.fromJson(friend))
        // .toList();
    user.password = userJson['password'];
    return user;
  }
}
