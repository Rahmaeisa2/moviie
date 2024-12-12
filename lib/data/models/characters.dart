import 'package:mooviee/data/models/locationModel.dart';
import 'package:mooviee/data/models/originModel.dart';

class Character{
  late int charID;
   late String name;
   late String statusIfDeadOrAlive;
   late String species;
   late String type;
   late String gender;
   late Origin origin;
   late Location location;
   late String image;
   late  List<String> episode;
   late String url;
   late String created; 

Character.fromJasn(Map<String,dynamic> json){
  charID=json['id'];
   name=json['name'];
   statusIfDeadOrAlive=json['status'];
   species=json['species'];
   gender=json['gender'];
   origin=json['Origin'];
   location=json['Location'];
   image=json['image'];
   episode=json['episode'];
  url=json['url'];
  created=json['created'];





  
  
  
  
  
  }

}
