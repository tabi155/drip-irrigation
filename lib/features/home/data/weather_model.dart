class WeatherModel {
  final double temperature;
  final int humidity;
  final String condition;

  WeatherModel({
    required this.temperature,
    required this.humidity,
    required this.condition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final main = json["main"] as Map<String, dynamic>?;
    final weather = json["weather"] as List?;

    if (main == null || weather == null || weather.isEmpty) {
      throw Exception("Invalid weather JSON structure");
    }

    return WeatherModel(
      temperature: (main["temp"] as num).toDouble(),
      humidity: (main["humidity"] as num).toInt(),
      condition: weather[0]["main"] ?? "Unknown",
    );
  }
}
