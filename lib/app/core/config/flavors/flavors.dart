import 'package:package_info_plus/package_info_plus.dart';

enum Flavor {
  dev,
  qa,
  hml,
  prod,
}

enum Environment {
  dev,
  qa,
  hml,
  prod,
}

extension FlavorExtension on Flavor {
  Environment get environment {
    switch (this) {
      case Flavor.dev:
        return Environment.dev;
      case Flavor.qa:
        return Environment.qa;
      case Flavor.hml:
        return Environment.hml;
      case Flavor.prod:
        return Environment.prod;
      default:
        return Environment.dev;
    }
  }
}

class EnvironmentFlavor {
  static Flavor? appFlavor;

  static Future<void> fetchFlavor() async {
    await PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      switch (packageInfo.packageName) {
        case "com.drteladoc.dev":
          appFlavor = Flavor.dev;
          break;
        case "com.drteladoc.qa":
          appFlavor = Flavor.qa;
          break;
        case "com.drteladoc.homolog":
          appFlavor = Flavor.hml;
          break;
        case "com.drteladoc":
          appFlavor = Flavor.prod;
          break;
        default:
          appFlavor = Flavor.dev;
      }
    });
  }

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Your app title - DEV';
      case Flavor.qa:
        return 'Your app title - QA';
      case Flavor.hml:
        return 'Your app title - HOM';
      case Flavor.prod:
        return 'Your app title';
      default:
        return 'Your app title';
    }
  }
}
