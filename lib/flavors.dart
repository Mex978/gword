enum Flavor {
  dev,
  qa,
  hml,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'your app name to dev';
      case Flavor.qa:
        return 'your app name to qa';
      case Flavor.hml:
        return 'your app name to hml';
      case Flavor.prod:
        return 'your app name to prod';
      default:
        return 'title';
    }
  }
}
