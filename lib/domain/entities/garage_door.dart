import 'package:remote_controller/main.dart';

class GarageDoor {
  bool _isIlluminated;

  bool _isOpened;

  GarageDoor({
    bool? isIlluminated,
    bool? isOpened,
  })  : _isIlluminated = isIlluminated ?? false,
        _isOpened = isOpened ?? false;

  bool get isIlluminated => _isIlluminated;

  bool get isOpened => _isOpened;

  void up() {
    _isOpened = true;
    log.d('Ворота открылись');
  }

  void down() {
    _isOpened = false;
    log.d('Ворота закрылись');
  }

  void lightOn() {
    _isIlluminated = true;
    log.d('Включилась подсветка ворот');
  }

  void lightOff() {
    _isIlluminated = false;
    log.d('Выключилась подсветка ворот');
  }
}
