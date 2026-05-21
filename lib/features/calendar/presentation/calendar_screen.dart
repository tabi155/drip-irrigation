import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_diss/features/calendar/data/zone_model.dart';
import 'package:movie_diss/features/calendar/presentation/cubit/calendar_cubit.dart';
import 'package:movie_diss/features/calendar/presentation/cubit/calendar_state.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  String format(DateTime d) {
    return "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    const zones = [
      Zone(id: "zone1", name: "Помидоры 🍅", humidity: 40, temp: 28),
      Zone(id: "zone2", name: "Огурцы 🥒", humidity: 60, temp: 26),
      Zone(id: "zone3", name: "Кукуруза 🌽", humidity: 35, temp: 30),
    ];
    DateTime focusedDay = DateTime.now();

    return BlocProvider(
      create: (_) => CalendarCubit(),
      child: BlocBuilder<CalendarCubit, CalendarState>(
        builder: (context, state) {
          final cubit = context.read<CalendarCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text("🌱 Watering Calendar"),
            ),
            body: Column(
              children: [
                /// 🌱 ZONE SELECTOR
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: zones.map((z) {
                      final selected = z.id == state.selectedZone;

                      return GestureDetector(
                        onTap: () => cubit.selectZone(z.id),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: selected ? Colors.green : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(z.name),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                /// 📅 CALENDAR
                TableCalendar(
                  firstDay: DateTime.utc(2020),
                  lastDay: DateTime.utc(2030),
                  focusedDay: focusedDay,
                  selectedDayPredicate: (day) {
                    final list = state.data[state.selectedZone] ?? [];
                    return list.contains(format(day));
                  },
                  onDaySelected: (selectedDay, fDay) {
                    focusedDay = fDay;
                    cubit.toggleDate(format(selectedDay));
                  },
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, _) {
                      final list = state.data[state.selectedZone] ?? [];
                      final selected = list.contains(format(day));

                      return Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: selected ? Colors.green : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "${day.day}",
                            style: TextStyle(
                              color: selected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                /// ⚙ AUTO MODE
                SwitchListTile(
                  title: const Text("🤖 Auto irrigation mode"),
                  value: state.autoMode,
                  onChanged: cubit.toggleAutoMode,
                ),

                const SizedBox(height: 10),

                const Text(
                  "✔ Tap date to schedule watering",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
