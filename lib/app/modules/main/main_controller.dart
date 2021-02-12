import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'main_controller.g.dart';

@Injectable()
class MainController = _MainControllerBase with _$MainController;

abstract class _MainControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
