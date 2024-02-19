class City {
  String name;
  String? state;
  String country;
  double latitude;
  double longitude;

  City.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        state = map['state'],
        latitude = map['lat'],
        longitude = map['lon'],
        country = map['country'];

  static List<City> fromMaps(List<dynamic> maps) {
    return maps.map((city) => City.fromMap(city)).toList();
  }
}
