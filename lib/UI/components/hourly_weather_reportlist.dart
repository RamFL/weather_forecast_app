import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/models/weather_model.dart';

class HourlyWeatherReportList extends StatelessWidget {
  final Hour? hour;

  const HourlyWeatherReportList({Key? key, this.hour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hour?.tempC?.round().toString() ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                "o",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.teal,
              shape: BoxShape.circle,
            ),
            child: Image.network("https:${hour?.condition?.icon.toString()}"),
          ),
          Text(
            DateFormat.j().format(
              DateTime.parse(hour?.time?.toString() ?? ""),
            ),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
