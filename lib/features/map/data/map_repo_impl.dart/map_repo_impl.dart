import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:movie_diss/core/app_routes/app_routes.dart';
import 'package:movie_diss/features/map/data/models/map_model.dart';
import 'package:movie_diss/features/map/data/models/map_second_model.dart';
import 'package:movie_diss/features/map/domain/map_repo.dart';

class GeolocationRepositoryImpl implements GeolocationRepository {
  GeolocationRepositoryImpl({required this.useCase});
  final GetLocationDataUseCase useCase;
  @override
  Future<GeolocationModel> getLocationByLatLng(LatLng latLng) async {
    return await useCase.getLocation(latLng);
  }

  @override
  Future<LocationByAddressModel> getLocationByAddress(String address) {
    return useCase.getLocationByAddress(address: address);
  }
}

class GetLocationByAddressUseCase {
  final Dio dio;

  GetLocationByAddressUseCase({required this.dio});
}

class GetLocationDataUseCase {
  GetLocationDataUseCase({required this.dio});
  final Dio dio;
  Future<GeolocationModel> getLocation(LatLng latLng) async {
    final Response response = await dio.get(ApiRoutes.goCade,
        queryParameters: {"key": AppConst.apiKey, "latlng": "${latLng.latitude},${latLng.longitude}"});
    return GeolocationModel.fromJson(response.data);
  }

  Future<LocationByAddressModel> getLocationByAddress({required String address}) async {
    final Response response = await dio.post(ApiRoutes.goCade, queryParameters: {
      "address": "Бишкек+${address.replaceAll(" ", "+")}",
      "key": AppConst.apiKey,
    });
    return LocationByAddressModel.fromJson(response.data);
  }
}
