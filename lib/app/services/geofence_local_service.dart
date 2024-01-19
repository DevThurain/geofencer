import 'dart:ffi';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:geofence_service/geofence_service.dart';

class GeofenceLocalService extends GetxService {
  static final _geofenceService = GeofenceService.instance.setup(
      interval: 5000,
      accuracy: 100,
      loiteringDelayMs: 60000,
      statusChangeDelayMs: 10000,
      useActivityRecognition: true,
      allowMockLocations: false,
      printDevLog: false,
      geofenceRadiusSortType: GeofenceRadiusSortType.DESC);

  GeofenceService get geofenceService => _geofenceService;
  final gpsStatus = false.obs;
  final locationInfo = ''.obs;
  final geofenceInfo = ''.obs;

  void onLocationChanged(bool status) {}

  @override
  void onInit() {
    _geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
    _geofenceService.addLocationChangeListener(_onLocationChanged);
    _geofenceService.addLocationServicesStatusChangeListener(_onLocationServicesStatusChanged);
    _geofenceService.addActivityChangeListener(_onActivityChanged);
    _geofenceService.addStreamErrorListener(_onError);
    _geofenceService.start(geofenceList).catchError(_onError);

    super.onInit();
  }

  static final geofenceList = [
    Geofence(
      id: 'a_bank_headoffice',
      latitude: 16.800556,
      longitude: 96.157835,
      radius: [
        GeofenceRadius(id: 'radius_100m', length: 100),
        // GeofenceRadius(id: 'radius_25m', length: 25),
        // GeofenceRadius(id: 'radius_250m', length: 250),
        GeofenceRadius(id: 'radius_200m', length: 200),
      ],
    )
  ];

  // This function is to be called when the geofence status is changed.
  Future<void> _onGeofenceStatusChanged(Geofence geofence, GeofenceRadius geofenceRadius,
      GeofenceStatus geofenceStatus, Location location) async {
    print('geofence: ${geofence.toJson()}');
    print('geofenceRadius: ${geofenceRadius.toJson()}');
    print('geofenceStatus: ${geofenceStatus.toString()}');
    var radiusJson = geofenceRadius.toJson();
    geofenceInfo.value = "${radiusJson['id']} - ${radiusJson['status']}";
    // _geofenceStreamController.sink.add(geofence);
  }

// This function is to be called when the activity has changed.
  void _onActivityChanged(Activity prevActivity, Activity currActivity) {
    print('prevActivity: ${prevActivity.toJson()}');
    print('currActivity: ${currActivity.toJson()}');
    // _activityStreamController.sink.add(currActivity);
  }

// This function is to be called when the location has changed.
  void _onLocationChanged(Location location) {
    print('location: ${location.toJson()}');
    locationInfo.value = "lat: ${location.toJson()['latitude']},long: ${location.toJson()['longitude']}";
  }

// This function is to be called when a location services status change occurs
// since the service was started.
  void _onLocationServicesStatusChanged(bool status) {
    print('isLocationServicesEnabled: $status');
    gpsStatus.value = status;
  }

// This function is used to handle errors that occur in the service.
  void _onError(error) {
    final errorCode = getErrorCodesFromError(error);
    if (errorCode == null) {
      print('Undefined error: $error');
      return;
    }

    print('ErrorCode: $errorCode');
  }
}
