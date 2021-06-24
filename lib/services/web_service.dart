import 'package:dio/dio.dart';
import 'package:rocky_morty_characters/models/result.dart';

class WebService {
  var dio = new Dio();

  Future<List<Results>> fetchData() async {
    String url = "https://rickandmortyapi.com/api/character";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final dataresult = response.data;
      Iterable list = dataresult['results'];
      print({'5555 ${list.length}'});
      return list.map((data) => Results.fromJson(data)).toList();
    } else {
      throw Exception('Failled to Get Data');
    }
  }
}
