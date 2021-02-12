import 'package:Devnology/app/pages/history/history_controller.dart';
import 'package:Devnology/app/pages/history/history_page.dart';
import 'package:Devnology/app/pages/home/home_page.dart';

import 'pages/home/home_controller.dart';
import 'package:Devnology/app/modules/main/main_module.dart';

import 'pages/login/login_controller.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:Devnology/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds =>
      [$HomeController, $LoginController, $AppController, $HistoryController];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: Main()),
        ModularRouter("/home", child: (_, args) => HomePage()),
        ModularRouter("/history", child: (_, args) => HistoryPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
