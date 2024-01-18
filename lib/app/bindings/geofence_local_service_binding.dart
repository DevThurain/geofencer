import 'package:geofencer/app/services/geofence_local_service.dart';
import 'package:get/get.dart';

class GeofenceLocalServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeofenceLocalService>(() => GeofenceLocalService());
  }
}
