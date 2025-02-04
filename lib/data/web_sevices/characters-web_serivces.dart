import 'package:dio/dio.dart';
import 'package:mooviee/constants/string.dart';

import '../models/characters.dart';

class CharacterWebServices {
  late Dio dio;

  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacter() async {
    try {
      final dio = Dio();
      final response = await dio.get('https://rickandmortyapi.com/api/character');
      // استخراج البيانات من المفتاح "results"
      return response.data['results'];
    } catch (e) {
      print('Error fetching characters: $e');
      return [];
    }
  }

}
