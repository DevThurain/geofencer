import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geofencer/app/modules/home/views/home_page.dart';
import 'package:geofencer/app/routes/app_pages.dart';
import 'package:get/route_manager.dart';

import 'flavors.dart';

class App extends StatelessWidget {

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: F.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.routes,
      initialRoute: HomePage.routeName,
    );
  }


}
