class Origin {
  late String origin_name ; 
  late String origin_url;

  Origin({required this.origin_name, required this.origin_url});

  Origin.fromJson(Map<String , dynamic> json){
    origin_name = json["name"];
    origin_url = json["url"];

  }
 Map<String , dynamic> toJson(){
 return {
      'name': origin_name,
      'url': origin_url,
    };
 }

}