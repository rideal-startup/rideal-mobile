class User {
  String username;
  String name;
  String surname;
  String city;
  String email;
  int points = 0;
  List<User> friends = [];
  String password;

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
      'surname': this.username,
      'city': this.city,
      'email': this.email,
      'password': this.password };
  }
}