import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

abstract class GeoLocatorProviderProtocol {
  Future<void> getCurrentPosition({
    ValueChanged<Position>? success,
    VoidCallback? failure,
  });
}

class GeoLocatorProvider extends GeoLocatorProviderProtocol {
  @override
  Future<void> getCurrentPosition({
    ValueChanged<Position>? success,
    VoidCallback? failure,
  }) async {
    if (!(await _hasPermission)) {
      final permission = await Geolocator.requestPermission();
      final isLocationDisabled = permission != LocationPermission.always && permission != LocationPermission.whileInUse;

      if (isLocationDisabled) {
        failure?.call();
      }
    }

    final position = await Geolocator.getCurrentPosition();
    success?.call(position);
  }

  Future<bool> get _hasPermission async {
    final status = await Geolocator.checkPermission();

    return status == LocationPermission.always || status == LocationPermission.whileInUse;
  }
}
