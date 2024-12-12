part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharacterLoaded extends CharactersState {
  final List characters; // Correct type

  CharacterLoaded(this.characters); // Constructor initializes the field
}
