import 'package:remote_controller/main.dart';

class Light {
  bool _isIlluminated;

  String _location;

  Light({
    required String location,
    bool? isIlluminated,
  })  : _location = location,
        _isIlluminated = isIlluminated ?? false;

  bool get isIlluminated => _isIlluminated;

  String get location => _location;

  void on() {
    _isIlluminated = true;
    log.d('$_location. Включился свет.');
  }

  void off() {
    _isIlluminated = false;
    log.d('$_location. Включился свет.');
  }
}
