import 'package:flutter/material.dart';
import 'package:geofencer/app.dart';
import 'package:geofencer/app/bindings/geofence_local_service_binding.dart';
import 'package:geofencer/flavors.dart';

void mainCommon(Flavor flavor) {
  F.appFlavor = flavor;

  GeofenceLocalServiceBinding().dependencies();
  runApp(const App());
}
