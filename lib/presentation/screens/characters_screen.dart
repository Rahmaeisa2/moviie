import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
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
    List<Character> allCharacters = [];
    late List<Character> searchedForCharacter ;
    bool _isSearching = false ;
    final _searchTextController = TextEditingController();

    Widget _buildSearchField(){
      return TextField(
        controller: _searchTextController,
        //علامه بتاع الكتابه المؤشر
        cursorColor:myColors.grey ,
        decoration: const InputDecoration(
          hintText: 'Search for character ...',
          border: InputBorder.none,
          hintStyle:TextStyle (
            color: myColors.grey,
            fontSize: 16,
          )
        ),
        style: const TextStyle(
          color: myColors.grey,
          fontSize: 16,),
        onChanged: (searchedCharacter){
          // هتاخد الحرف او التكست اللي اتكتب وتبقي تظهر اللي بيبدا بالحرف دا
          addSearchedOrItemToSearchedList(searchedCharacter);
        },
      );
    }
    //searchedCharacter اللي الuser هيكتبه
    //هتعمل فلتر للي راجع
    void addSearchedOrItemToSearchedList(String searchedCharacter){
      searchedForCharacter = allCharacters.
      where((character) => character.name.toLowerCase().startsWith(searchedCharacter))
          .toList();
      setState(() {

      });
    }
    List<Widget> _BuildAppBarAction(){
      if(_isSearching){
        return[
          IconButton(onPressed: (){
            clearSearch();
            Navigator.pop(context);
            //هترجع الاسكرين اللي فيها الليسته تاني
          },
              icon: const Icon(Icons.clear),color: myColors.grey,)
        ];
      }else{
        return[
          IconButton(onPressed: _startSearching,
            icon: const Icon(Icons.search),
            color: myColors.grey,)
        ];
      }
    }
    //search mode
    void _startSearching(){
      //back icon
      ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
      setState(() {
        _isSearching=true;
      });
    }
    void _stopSearching(){
      clearSearch();
      setState(() {
        _isSearching= false;
      });
    }
    //هشيل اي داتا فيه
    void clearSearch(){
      _searchTextController.clear();

    }
    Widget buildNoInternetWidget (){
      return Center(
        child: Container(
          color: myColors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text("check your internet ....",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: myColors.grey,
              ),
              ),
              Image.asset("assets/images/NoData.png"),
            ],
          ),
        ),
      );
    }
  @override
  void initState() {
    super.initState();
     BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }
  Widget buildBlocWidget (){
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharacterLoaded){
          allCharacters = (state).characters ;
          return buildLoadedListWidget();
        }
          else if(state is CharactersLoading){
          return showLoadingIndicator();


        }else if (state is CharactersError){
            return Center(child: Text('Error :${state.message}'),);
        }
          return const Center(child:  Text("No data availabe"),);
      },
    );

  }
  Widget showLoadingIndicator(){
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
    if (allCharacters.isEmpty) {
      return const Center(
        child: Text("No characters found."),
      );
    }

    return GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount:2,
      childAspectRatio: 2/3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,

    ),
    shrinkWrap: true,
    physics:const ClampingScrollPhysics(),
    padding: EdgeInsets.zero,
      //لو السيرش مفيش فيه حاجه هيعرض اللست العاديه لو لا هيفلتر
      itemCount:_searchTextController.text.isEmpty? allCharacters.length : searchedForCharacter.length,
    itemBuilder: (context , index){

      return CharacterItem(character:_searchTextController.text.isEmpty?
      allCharacters[index]
          :searchedForCharacter[index]
        ,);

    },);
  }
Widget _buildAppBarTitle (){
      return const Text('Characters' , style: TextStyle(
        color: myColors.grey,
      ),);
}


  Widget build(BuildContext context) {
    return  Scaffold(

      appBar:AppBar(
        backgroundColor: myColors.yellow,
        leading: _isSearching? const BackButton(
          color:  myColors.grey,
        ):Container(),
        title: _isSearching? _buildSearchField() : _buildAppBarTitle(),
        actions: _BuildAppBarAction(),
      ),
      body:  OfflineBuilder(
      connectivityBuilder: (
      BuildContext context,
      List<ConnectivityResult> connectivity,
      Widget child,){
        final bool connected = !connectivity.contains(ConnectivityResult.none);
        if (connected){
          return buildBlocWidget();
        }else{
          return buildNoInternetWidget();
        }
      },
      child: showLoadingIndicator(),),

      );

  }
}