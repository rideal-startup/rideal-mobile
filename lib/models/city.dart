class City {
  final String id;
  final String name;
  final String country;
  final int postalCode;

  City({this.id, this.name, this.country, this.postalCode});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      country: json['country'],
      name: json['name'],
      id: json['id'],
      postalCode: json['postalCode']
    );
  }
}