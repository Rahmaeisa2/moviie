import 'package:flutter/material.dart';
import 'package:mooviee/constants/myColors.dart';

import '../../data/models/characters.dart';

class characterDetailsScreen extends StatelessWidget {
   final Character character ;

   const characterDetailsScreen({Key? key, required this.character}) : super(key: key);
  Widget buildSliverAppBar(){
    return SliverAppBar(
      expandedHeight:600 ,
      pinned: true,
      stretch: true,
      backgroundColor: myColors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(character.name ,
        style: TextStyle(color: myColors.white,
        ),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.charID,
          child: Image.network(character.image ,
            fit: BoxFit.none,
            ),
        ),
      ),
    );
  }
  Widget characterInfo (String title , String value){
    return RichText(
      maxLines: 1,
        overflow: TextOverflow.ellipsis,

        text: TextSpan(
          children: [
            TextSpan(
              text :title,
              style: TextStyle(
                color: myColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              )
            ),
            TextSpan(
                text :value,
                style: TextStyle(
                  color: myColors.white,
                  fontSize: 12,
                )
            ),
          ]

        ),);
  }

  Widget buildDivider(double endIndent){
    return Divider (
      color: myColors.yellow,
      height: 30,
      //طول كل واحد
      endIndent: endIndent,
      thickness: 2,

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(delegate: SliverChildListDelegate(
            [
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(9),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo("Name : " , character.name,),
                    buildDivider(311),
                    characterInfo("StatusIfDeadOrAlive : " , character.statusIfDeadOrAlive,),
                    buildDivider(300),
                    characterInfo("Species : " , character.species,),
                    buildDivider(311),
                    characterInfo("Gender : " , character.gender,),
                    buildDivider(311),
                    characterInfo("Origin Name : " , character.origin.origin_name,),
                    buildDivider(311),
                    characterInfo("Origin URL : " , character.origin.origin_url,),
                    buildDivider(311),
                    characterInfo("Location : " , character.location?.location_name?? " unknow",),
                    buildDivider(311),
                    characterInfo("Location URL : " , character.location?.location_url?? " unknow",),
                    buildDivider(311),

                    characterInfo("Image : " , character.image,),
                    buildDivider(311),
                    characterInfo("Episode : " , character.episode.join(" / "),),
                    buildDivider(311),
                    characterInfo("Url : " , character.url,),
                    buildDivider(311),
                    characterInfo("Created : " , character.created,),
                    buildDivider(311),


                  ],
                ),
              )
            ],
          ),
          ),
        ],
      ),
    );
  }
}