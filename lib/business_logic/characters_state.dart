part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharacterLoaded extends CharactersState {
  final List<Character> characters; // Correct type

  CharacterLoaded(this.characters); // Constructor initializes the field
}
class CharactersLoading extends CharactersState {}

class CharactersError extends CharactersState {
  final String message;

  CharactersError(this.message);
}