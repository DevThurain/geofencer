import 'package:geofence_service/geofence_service.dart';
import 'package:geofencer/app/services/geofence_local_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final geofenceLocalService = Get.find<GeofenceLocalService>();
  var gpsStatus = false.obs;
  var locationInfo = ''.obs;
  var geofenceInfo = ''.obs;

  @override
  void onInit() {
    gpsStatus = geofenceLocalService.gpsStatus;
    locationInfo = geofenceLocalService.locationInfo;
    geofenceInfo = geofenceLocalService.geofenceInfo;
    super.onInit();
  }
}
