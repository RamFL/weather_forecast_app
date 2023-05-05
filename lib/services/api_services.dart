import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_forecast_app/constants/constants.dart';
import '../models/weather_model.dart';

class ApiServices {
  Future<WeatherModel> getWeatherData(String searchText) async {
    String url = "$base_url&q=$searchText&days=7";

    try {
      Response response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        WeatherModel weatherModel = WeatherModel.fromJson(json);

        return weatherModel;
      } else {
        throw ("No data found");
      }
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
