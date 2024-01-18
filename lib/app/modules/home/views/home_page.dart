import 'package:flutter/material.dart';
import 'package:geofencer/app/modules/home/controllers/home_controller.dart';
import 'package:geofencer/flavors.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  static const routeName = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(F.title)),
      body: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: Get.width),
              Text("is gps available : ${controller.gpsStatus.value}"),
              Text("location info : ${controller.locationInfo.value}"),
              Text("geofence info : ${controller.geofenceInfo.value}"),
            ],
          )),
    );
  }
}
