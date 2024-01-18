enum Flavor {
  qa,
  uat,
  dev,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.qa:
        return 'Geofencer QA';
      case Flavor.uat:
        return 'Geofencer UAT';
      case Flavor.dev:
        return 'Geofencer DEV';
      default:
        return 'title';
    }
  }

}
