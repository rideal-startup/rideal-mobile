class User {
  String id;
  String username;
  String name;
  String surname;
  String city;
  String cityName;
  String email;
  int points = 0;
  List<User> friends = [];
  String password;

  User({this.id,
        this.username, 
        this.name,
        this.surname,
        this.city,
        this.cityName,
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

  static User fromJson(Map<String, dynamic> userJson) {
    User user = User();
    user.id = userJson['id'];
    user.username = userJson['username'];
    user.name = userJson['name'];
    user.surname = userJson['surname'];
    user.city = userJson['city']['id'];
    user.cityName = userJson['city']['name'];
    user.email = userJson['email'];
    user.points = userJson['points'];
    user.friends = userJson['friends'].map<User>((friend)=>User.fromJson(friend)).toList();
    user.password = userJson['password'];
    return user;
  }
}