class CalendarState {
  final Map<String, List<String>> data;
  final String selectedZone;
  final bool autoMode;

  CalendarState({
    required this.data,
    required this.selectedZone,
    required this.autoMode,
  });

  CalendarState copyWith({
    Map<String, List<String>>? data,
    String? selectedZone,
    bool? autoMode,
  }) {
    return CalendarState(
      data: data ?? this.data,
      selectedZone: selectedZone ?? this.selectedZone,
      autoMode: autoMode ?? this.autoMode,
    );
  }
}