import 'package:Devnology/app/pages/login/login_page.dart';

import 'main_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Main extends ChildModule {
  @override
  List<Bind> get binds => [
        $MainController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<MainModule>.of();
}
