
import 'package:remote_controller/domain/command.dart';
import 'package:remote_controller/domain/entities/ceiling_fan.dart';

class CeilingFanHighCommand implements Command {
  static late int _prevSpeed;
  final CeilingFan _fan;

  CeilingFanHighCommand({
    required CeilingFan fan,
  }) : _fan = fan {
    _prevSpeed = _fan.getSpeed;
  }

  @override
  void execute() {
    _prevSpeed = _fan.getSpeed;
    _fan.high();
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