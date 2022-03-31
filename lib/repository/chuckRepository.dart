import 'dart:convert';
import 'package:chucknoris/model/chuckModel.dart';
import 'package:dio/dio.dart';
import 'dart:math';

class ChuckRepository {
  var dio = Dio();
  Future<ChuckModel> getUser() async {
    var random = Random();
    var num = random.nextInt(200);
    final result =
        await Dio().get('https://rickandmortyapi.com/api/character/$num');
    print(result.data.runtimeType.toString());
    if (result.statusCode == 200) {
      return ChuckModel.fromJson(result.data);
    }
    return ChuckModel();
  }
}
