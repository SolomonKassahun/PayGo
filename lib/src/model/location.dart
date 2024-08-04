class Location {
  String location;
  Location({required this.location});
  Location.fromJson(Map<String,dynamic> json ): 
  location = json['location'];
}