import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mooviee/data/Repo/character_repo.dart';
import 'package:mooviee/data/models/characters.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepo characterRepo ; 
   List<Character>?Characters = [];
  CharactersCubit(this.characterRepo) : super(CharactersInitial());
  Future<void> getAllCharacter() async {
    try {
      final characters = await characterRepo.getAllCharacter();
      emit(CharacterLoaded(Character as List));
      this.Characters = Characters;
    } catch (e) {
      print("Error: $e");
      emit(CharactersInitial()); // Emit a fallback state if needed
    }
  }
}