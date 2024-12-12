import 'package:flutter/material.dart';
import 'package:mooviee/constants/myColors.dart';
import 'package:mooviee/data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character ;

  const CharacterItem({super.key, required this.character}); 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color:myColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        // ignore: sort_child_properties_last
        child: Container(
        color: myColors.grey,
        child: character.image.isNotEmpty?
        FadeInImage.assetNetwork(
          placeholder: '', image: character.image,
        fit:BoxFit.cover,
        ):
        Image.asset(''),
      ),
      footer: Container(
        width: double.infinity,
        padding:const EdgeInsets.symmetric(horizontal: 15 , vertical: 1 ),
        color: Colors.black54,
        alignment: Alignment.bottomCenter,
        // ignore: unnecessary_string_interpolations
        child: Text(
          '${character.name}',
          style: const TextStyle(
            height: 1.3,
            fontSize: 16,
            color: myColors.white,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,

        ),
      ),
      ),
      
    
    );
  }
}