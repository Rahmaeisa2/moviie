class Location {
  late String location_name ; 
  late String location_url;
  
  Location.fromJasn(Map<String , dynamic> json){
    location_name = json["name"];
    location_url = json["url"];

  }
 Map<String , dynamic> toJson(){
 return {
      'name': location_name,
      'url': location_url,
    };
 }

}