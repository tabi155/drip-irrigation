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
            backgroundColor: const Color(0xFFF6F8FA),
            appBar: AppBar(
              title: const Text("🌱 Календарь полива"),
              centerTitle: true,
              elevation: 0,
              backgroundColor: const Color(0xFFF6F8FA),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Зоны",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: zones.map((z) {
                          final selected = z.id == state.selectedZone;

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: const EdgeInsets.only(right: 10),
                            child: ChoiceChip(
                              label: Text(z.name),
                              selected: selected,
                              selectedColor: Colors.green,
                              labelStyle: TextStyle(
                                color: selected ? Colors.white : Colors.black,
                              ),
                              onSelected: (_) => cubit.selectZone(z.id),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TableCalendar(
                          firstDay: DateTime.utc(2020),
                          lastDay: DateTime.utc(2030),
                          focusedDay: focusedDay,
                          headerStyle: const HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                          ),
                          selectedDayPredicate: (day) {
                            final list = state.data[state.selectedZone] ?? [];
                            return list.contains(format(day));
                          },
                          onDaySelected: (selectedDay, fDay) {
                            focusedDay = fDay;
                            cubit.toggleDate(format(selectedDay));
                          },
                          calendarStyle: CalendarStyle(
                            todayDecoration: BoxDecoration(
                              color: Colors.orange.shade200,
                              shape: BoxShape.circle,
                            ),
                            selectedDecoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: SwitchListTile(
                        title: const Text(
                          "🤖 Автоматический режим полива",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: const Text(
                          "Автоматический режим полива",
                        ),
                        activeThumbColor: Colors.green,
                        value: state.autoMode,
                        onChanged: cubit.toggleAutoMode,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green.shade100),
                      ),
                      child: const Text(
                        "✔ Нажмите на дату, чтобы запланировать полив выбранной зоны",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
