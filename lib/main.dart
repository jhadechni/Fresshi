import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

import 'app/util/dependency.dart';
import 'presentation/app.dart';

void main() async {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const App());
}

initServices() async {
  logInfo('starting services ...');
  //await Get.putAsync(() => LocalStorageService().init());
  logInfo('All services started...');
}
