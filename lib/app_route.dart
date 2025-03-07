import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mooviee/business_logic/characters_cubit.dart';
import 'package:mooviee/data/Repo/character_repo.dart';
import 'package:mooviee/data/web_sevices/characters-web_serivces.dart';
import 'package:mooviee/presentation/screens/characters_details.dart';
import 'package:mooviee/presentation/screens/characters_screen.dart';

import 'data/models/characters.dart';

class AppRoute {
  late CharacterRepo characterRepo; 
  late CharactersCubit charactersCubit ;  

  AppRoute(){
    //create new one
    characterRepo = CharacterRepo(CharacterWebServices());
    charactersCubit = CharactersCubit(characterRepo);


  }
  Route? generateRoute (RouteSettings settings){
    switch (settings.name){
      case '/':
      return MaterialPageRoute(builder: (_) =>BlocProvider(create: (BuildContext contxt)=> CharactersCubit(characterRepo),
      child: const charactersScreen(),
      
      
      ) );
      case '/characters_Details':
        final character = settings.arguments as Character;
      return MaterialPageRoute(builder: (_)=> characterDetailsScreen(character: character,));
    }
  }
}