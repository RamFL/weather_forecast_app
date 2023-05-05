import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/models/weather_model.dart';

class FutureForecastDays extends StatelessWidget {
  final Forecastday? forecastday;
  const FutureForecastDays({Key? key, this.forecastday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.network("https:${forecastday?.day?.condition?.icon ?? " "}"),
          Expanded(
            child: Text(
              DateFormat.MMMEd()
                  .format(DateTime.parse(forecastday?.date.toString() ?? "")),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Text(
              forecastday?.day?.condition?.text ?? "",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "^${forecastday?.day?.maxtempC?.round()}/${forecastday?.day?.mintempC?.round()}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
