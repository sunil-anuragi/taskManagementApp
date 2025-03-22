import 'package:jewellery/app_configuration.dart';
import 'package:jewellery/utils/enums.dart';

class AppConfigProvider {
  AppConfiguration? appConfiguration;
  static final _instance = AppConfigProvider._internal();

  AppConfigProvider._internal();

  void setAppConfig(AppConfiguration appConfiguration) {
    this.appConfiguration = appConfiguration;
  }

  factory AppConfigProvider() {
    return _instance;
  }

  String get getBaseurl => appConfiguration!.baseUrl;
  AppEnvironment get getAppEnv => appConfiguration!.appEnvironment;
}
