class Location {
  late String location_name;
  late String location_url;

  // Named constructor
  Location({required this.location_name, required this.location_url});

  // fromJson method
  Location.fromJson(Map<String, dynamic> json) {
    location_name = json["name"] ?? "Unknown";
    location_url = json["url"] ?? "";
  }

  Map<String, dynamic> toJson() {
    return {
      'name': location_name,
      'url': location_url,
    };
  }
}
