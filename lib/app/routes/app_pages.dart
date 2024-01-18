import 'package:geofencer/app/modules/home/bindings/home_binding.dart';
import 'package:geofencer/app/modules/home/views/home_page.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final routes = [
   GetPage(
      name: HomePage.routeName,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
