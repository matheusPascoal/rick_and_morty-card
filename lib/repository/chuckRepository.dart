import 'dart:convert';
import 'package:chucknoris/model/RickandMortyModel.dart';
import 'package:dio/dio.dart';
import 'dart:math';

class ChuckRepository {
  var dio = Dio();
  Future<RickandMortyModel> getUser() async {
    var random = Random();
    var num = random.nextInt(200);
    final result =
        await Dio().get('https://rickandmortyapi.com/api/character/$num');
    print(result.data.runtimeType.toString());
    if (result.statusCode == 200) {
      return RickandMortyModel.fromJson(result.data);
    }
    return RickandMortyModel();
  }
}
