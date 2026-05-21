import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_diss/features/map/presentation/cubit/map_cubit.dart';
import 'package:movie_diss/features/map/presentation/cubit/map_state.dart';

class MockMapScreen extends StatelessWidget {
  const MockMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MockMapCubit(),
      child: const _MockMapView(),
    );
  }
}

class _MockMapView extends StatelessWidget {
  const _MockMapView();

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      body: BlocBuilder<MockMapCubit, MockMapState>(
        builder: (context, state) {
          return Stack(
            children: [
              /// 🗺 FAKE MAP
              GestureDetector(
                onPanUpdate: (details) {
                  context.read<MockMapCubit>().moveMarker(details.delta);
                },
                child: SizedBox.expand(
                  child: Image.asset(
                    "assets/images/map_mock.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              /// 📍 MARKER (animated)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                left: state.offset.dx,
                top: state.offset.dy,
                child: const Icon(
                  Icons.location_pin,
                  size: 45,
                  color: Colors.red,
                ),
              ),

              /// 🔍 SEARCH PANEL
              Positioned(
                bottom: 100,
                left: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xff1F212A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: controller,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Search city (Bishkek, Osh...)",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<MockMapCubit>().searchAddress(controller.text);
                        },
                        child: state.loading
                            ? const SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text("Search"),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.address,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
