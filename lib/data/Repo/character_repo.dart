import 'package:flutter/material.dart';
import 'package:mooviee/data/models/characters.dart';
import 'package:mooviee/data/web_sevices/characters-web_serivces.dart';

class CharacterRepo{
  final CharacterWebServices characterWebServices ;

  CharacterRepo(this.characterWebServices);


  Future<List<Character>> getAllCharacter() async{
    final characters = await characterWebServices.getAllCharacter();
    // ignore: avoid_types_as_parameter_names
    return characters.map((character) => Character.fromJson(character)).toList();
  }

}