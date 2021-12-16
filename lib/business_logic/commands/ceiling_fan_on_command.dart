import 'package:remote_controller/business_logic/command.dart';
import 'package:remote_controller/devices/ceiling_fan.dart';

class CeilingFanOnCommand implements Command {
  final CeilingFan _fan;

  CeilingFanOnCommand({
    required CeilingFan fan,
  }) : _fan = fan;

  @override
  void execute() {
    _fan.medium();
  }
}
