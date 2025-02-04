import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mooviee/data/Repo/character_repo.dart';
import 'package:mooviee/data/models/characters.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
    final CharacterRepo characterRepo ;
   List<Character> characters =[];

    CharactersCubit(this.characterRepo) : super(CharactersInitial());

   Future<List<Character>> getAllCharacters() async {
     try {
       emit(CharactersLoading()); // حالة تحميل
       final characters = await characterRepo.getAllCharacter();
       this.characters = characters;
       emit(CharacterLoaded(characters)); // حالة نجاح
     } catch (error) {
       emit(CharactersError(error.toString())); // حالة خطأ
     }
     return characters;
   }

  }
