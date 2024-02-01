import 'dart:convert';
import 'package:weather_app/core/utils/constances.dart';
import 'package:dio/dio.dart';
import '../models/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel?> getWeatherByCityName(String cityName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel?> getWeatherByCityName(String cityName) async {
    try {
      final dio = Dio();
      final response = await dio.get(
          '${Appconstance.baseUrl}weather?q=$cityName&appid=${Appconstance.APIKey}');
      print(response.data);
      return WeatherModel.fromJson(response.data);
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }
}
