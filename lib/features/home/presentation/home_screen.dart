import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_diss/core/storage/shared_pref.dart';
import 'package:movie_diss/features/home/data/weather_repo_impl.dart';
import 'package:movie_diss/features/home/domain/weather_interactor.dart';
import 'package:movie_diss/features/home/presentation/cubit/weather_cubit.dart';
import 'package:movie_diss/features/home/presentation/cubit/weather_state.dart';
import 'package:movie_diss/features/home/presentation/zone_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "";

  final List<Map<String, dynamic>> zones = const [
    {"name": "Помидоры 🍅", "humidity": 40, "temp": 28},
    {"name": "Огурцы 🥒", "humidity": 60, "temp": 26},
    {"name": "Кукуруза 🌽", "humidity": 35, "temp": 30},
  ];

  @override
  void initState() {
    super.initState();
    loadName();
  }

  Future<void> loadName() async {
    final userName = await LocalStorage.getName();

    setState(() {
      name = userName;
    });
  }

  Future<void> _refreshWeather(BuildContext context) async {
    final cubit = context.read<WeatherCubit>();
    await cubit.loadWeather();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(
        WeatherInteractor(
          WeatherRepositoryImpl(),
        ),
      )..loadWeather(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          title: Text(
            'Hi, $name 👋',
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () => _refreshWeather(context),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🌤 WEATHER
                BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherLoading) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (state is WeatherSuccess) {
                      final weather = state.weather;

                      return Container(
                        width: double.infinity,
                        height: 160,
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: weather.condition == "Clouds"
                                ? [Colors.blueGrey, Colors.grey]
                                : weather.condition == "Rain"
                                    ? [Colors.blue, Colors.indigo]
                                    : [Colors.orange, Colors.deepOrange],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "🌤 ${weather.condition}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${weather.temperature.toStringAsFixed(0)}°C",
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              "Bishkek",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),

                /// 🌱 TITLE
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "🌱 My Zones",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                /// 🌱 ZONES LIST
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: zones.length,
                  itemBuilder: (context, index) {
                    final zone = zones[index];

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            zone["name"],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text("Влажность: ${zone["humidity"]}%"),
                          Text("Температура: ${zone["temp"]}°C"),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ZoneDetailScreen(
                                      name: zone["name"],
                                      humidity: zone["humidity"],
                                      temp: zone["temp"],
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              child: const Text(
                                "Подробнее",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
