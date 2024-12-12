import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mooviee/business_logic/characters_cubit.dart';
import 'package:mooviee/constants/myColors.dart';
import 'package:mooviee/data/models/characters.dart';
import 'package:mooviee/presentation/widgets/character_item.dart';

import '../../data/models/characters.dart';
import '../../data/models/characters.dart';

class charactersScreen extends StatefulWidget {
  const charactersScreen({super.key});


  @override
  State<charactersScreen> createState() => _charactersScreenState();
}

// ignore: camel_case_types
class _charactersScreenState extends State<charactersScreen> {
    late List<Character> allCharacters=[] ; 

  @override
  void initState(){
    super.initState();
    fetchCharacter();}


  Future<void> fetchCharacter() async {
  final charactersCubit = BlocProvider.of<CharactersCubit>(context);
  await charactersCubit.getAllCharacter(); // Await async call
  setState(() {});
}
  Widget buildBlocWidget (){
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharacterLoaded){
          allCharacters = (state).characters.cast<Character>() ;
          return buildLoadedListWidget();

        }else{
          return showLoadingIdicator();
        }
      },
    );

  }
  Widget showLoadingIdicator(){
    return const Center(
      child: CircularProgressIndicator(color: myColors.grey,),
    );
  }
  Widget buildLoadedListWidget(){
    return  SingleChildScrollView(
      child: Container(
        color: myColors.grey,
        child: Column(
          children: [
             buildCharactersList(),
          ]
        ),

      )

    );
  }
  Widget buildCharactersList(){
    return GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount:2,
      childAspectRatio: 2/3,
      crossAxisSpacing: 1, 
      mainAxisSpacing: 1,
    
    ), 
    shrinkWrap: true,
    physics:const ClampingScrollPhysics(),
    padding: EdgeInsets.zero,
          itemCount: allCharacters.length,
  
    itemBuilder: (context , index){
      return CharacterItem(character: allCharacters[index],);

    },);
  }



  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: myColors.yellow,
        title: const Text('Characters' , style: TextStyle(
          color: myColors.grey,
        ),),
      ),
      body: buildBlocWidget(),
      
    );
  }
}