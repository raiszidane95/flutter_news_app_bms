import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'config.dart';
import 'presentation/controllers/loading.controller.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await _initStorage();
      _initGetConnect();
      _initGlobalLoading();
      _initScreenPreference();
    } catch (err) {
      rethrow;
    }
  }

  static void _initGlobalLoading() {
    final loading = LoadingController();
    Get.put(loading);
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
    Get.put(GetStorage());
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static Future<void> _initGetConnect() async {
    final connect = GetConnect();
    final url = ConfigEnvironments.getEnvironments()['url'];
    connect.httpClient.baseUrl = url;
    print(url);
    Get.put(connect);
  }
}
