import 'package:remote_controller/business_logic/command.dart';
import 'package:remote_controller/devices/ceiling_fan.dart';

class CeilingFanMediumCommand implements Command {
  static late int _prevSpeed;
  final CeilingFan _fan;

  CeilingFanMediumCommand({
    required CeilingFan fan,
  }) : _fan = fan {
    _prevSpeed = _fan.getSpeed;
  }

  @override
  void execute() {
    _prevSpeed = _fan.getSpeed;
    _fan.medium();
  }

  @override
  void undo() {
    switch (_prevSpeed) {
      case 0:
        _fan.off();
        break;
      case 1:
        _fan.low();
        break;
      case 2:
        _fan.medium();
        break;
      case 3:
        _fan.high();
        break;
    }
  }
}
