import 'package:dio/dio.dart';
import 'package:mooviee/constants/string.dart';

class CharacterWebServices {
  late Dio dio;

  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: BaseUrl,
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacter() async {
    try {
    
      Response response = await dio.get('character');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
