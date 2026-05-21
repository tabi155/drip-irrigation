import 'package:flutter/material.dart';

class ZoneDetailScreen extends StatelessWidget {
  final String name;
  final int humidity;
  final int temp;

  const ZoneDetailScreen({
    super.key,
    required this.name,
    required this.humidity,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    bool pumpOn = false;
    bool autoMode = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return Scaffold(
          appBar: AppBar(
            title: Text(name),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "🌱 $name",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                Text("💧 Влажность: $humidity%"),
                Text("🌡 Температура: $temp°C"),

                const SizedBox(height: 30),

                /// BUTTONS
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      pumpOn = true;
                    });
                  },
                  child: const Text("Включить полив"),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      pumpOn = false;
                    });
                  },
                  child: const Text("Остановить"),
                ),

                const SizedBox(height: 20),

                /// AUTO SWITCH
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Авто режим"),
                    Switch(
                      value: autoMode,
                      onChanged: (value) {
                        setState(() {
                          autoMode = value;
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Text(
                  pumpOn ? "🚿 Полив ВКЛ" : "⛔ Полив ВЫКЛ",
                  style: TextStyle(
                    fontSize: 18,
                    color: pumpOn ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}