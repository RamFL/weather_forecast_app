import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/models/weather_model.dart';

class TodaysWeather extends StatelessWidget {
  final WeatherModel? weatherModel;
  const TodaysWeather({Key? key, this.weatherModel}) : super(key: key);
  {}
  WeatherType getWeatherType (Current? current) {

    if (current?.isDay == 1) {

      if (current?.condition?.text == "Sunny") {
        return WeatherType.sunny;
      }else if (current?.condition?.text == "OverCast") {
        return WeatherType.overcast;
      }else if (current?.condition?.text == "Partly Cloudy") {
        return WeatherType.cloudy;
      }else if (current?.condition?.text == "Cloudy") {
        return WeatherType.cloudy;
      }else if (current?.condition?.text == "Mist") {
        return WeatherType.foggy;
      }else if (current?.condition?.text == "Moderate rain") {
        return WeatherType.lightRainy;
      }else if (current?.condition?.text == "Patchy rain possible") {
        return WeatherType.cloudy;
      }else if (current?.condition?.text == "Clear") {
        return WeatherType.sunny;
      }else if (current?.condition?.text == "Light rain shower") {
        return WeatherType.middleRainy;
      }else if (current?.condition?.text == "Light drizzle") {
        return WeatherType.middleRainy;
      } else if (current!.condition!.text!.contains("thunder")) {
        return WeatherType.thunder;
      } else if (current!.condition!.text!.contains("showers")) {
        return WeatherType.middleSnow;
      } else if (current!.condition!.text!.contains("rain")) {
        return WeatherType.heavyRainy;
      }
    }else {
      if (current?.condition?.text == "Sunny") {
        return WeatherType.sunnyNight;
      }else if (current?.condition?.text == "OverCast") {
        return WeatherType.overcast;
      }else if (current?.condition?.text == "Partly Cloudy") {
        return WeatherType.cloudyNight;
      }else if (current?.condition?.text == "Cloudy") {
        return WeatherType.cloudyNight;
      }else if (current?.condition?.text == "Mist") {
        return WeatherType.foggy;
      }else if (current?.condition?.text == "Moderate rain") {
        return WeatherType.lightRainy;
      }else if (current?.condition?.text == "Patchy rain possible") {
        return WeatherType.cloudyNight;
      }else if (current?.condition?.text == "Clear") {
        return WeatherType.sunnyNight;
      }else if (current?.condition?.text == "Light rain shower") {
        return WeatherType.middleRainy;
      }else if (current?.condition?.text == "Light drizzle") {
        return WeatherType.middleRainy;
      } else if (current!.condition!.text!.contains("thunder")) {
        return WeatherType.thunder;
      } else if (current!.condition!.text!.contains("showers")) {
        return WeatherType.middleSnow;
      } else if (current!.condition!.text!.contains("rain")) {
        return WeatherType.heavyRainy;
      }
    }




    return WeatherType.thunder;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(
          weatherType: getWeatherType(weatherModel?.current),
          width: MediaQuery.of(context).size.width,
          height: 300,
        ),
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      weatherModel?.location?.name ?? "",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      DateFormat.yMMMMEEEEd().format(DateTime.parse(
                          weatherModel?.current?.lastUpdated.toString() ?? "")),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white12,
                    ),
                    child: Image.network(
                        "https:${weatherModel?.current?.condition?.icon ?? ""}"),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            weatherModel?.current?.tempC?.round().toString() ??
                                "",
                            style: const TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                          const Text(
                            "o",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.red),
                          ),
                        ],
                      ),
                      Text(
                        weatherModel?.current?.condition?.text ?? "",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Feels Like",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Text(
                              weatherModel?.current?.feelslikeC?.round().toString() ?? "",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              "Wind",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Text(
                              "${weatherModel?.current?.windKph?.round()} Km/h",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Humidity",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              "${weatherModel?.current?.humidity} %",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              "Visibility",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              "${weatherModel?.current?.visKm?.round()} Km",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
