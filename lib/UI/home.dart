import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast_app/UI/components/future_forecast_days.dart';
import 'package:weather_forecast_app/UI/components/hourly_weather_reportlist.dart';
import 'package:weather_forecast_app/UI/components/todays_weather.dart';
import 'package:weather_forecast_app/models/weather_model.dart';
import 'package:weather_forecast_app/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices apiServices = ApiServices();
  String searchText = "auto:ip";
  TextEditingController searchInputController = TextEditingController();

  showSearchInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Search Location"),
            content: TextField(

              controller: searchInputController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search by city,Zip,lat,lng",
                prefixIcon: Icon(Icons.search, color: Colors.blue, size: 35,),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (searchInputController.text.isEmpty) {
                    return;
                  }
                  searchText = searchInputController.text.trim();
                  setState(() {
                    searchInputController.clear();
                  });

                  Navigator.pop(context);
                },
                child: const Text(
                  "Search",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const Text('Mausam Samachar'),
        actions: [
          IconButton(
            onPressed: () async {
              await showSearchInputDialog(context);
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              searchText = "auto:ip";
              setState(() {});
            },
            icon: const Icon(Icons.my_location),
          ),
        ],
        backgroundColor: Colors.black54,
        elevation: 0,
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: FutureBuilder(
          future: apiServices.getWeatherData(searchText),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherModel? weatherModel = snapshot.data;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    TodaysWeather(
                      weatherModel: weatherModel,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Weather by Hours",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: weatherModel
                            ?.forecast?.forecastday?[0].hour?.length,
                        itemBuilder: (context, index) {
                          Hour? hour = weatherModel
                              ?.forecast?.forecastday?[0].hour?[index];

                          return HourlyWeatherReportList(
                            hour: hour,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Next 7 days weather",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/2,
                      child: ListView.builder(
                        itemCount: weatherModel?.forecast?.forecastday?.length,
                        itemBuilder: (context, index) {
                          Forecastday? forecastDay =
                          weatherModel?.forecast?.forecastday?[index];

                          return FutureForecastDays(
                            forecastday: forecastDay,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Something Error has occurred"),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
