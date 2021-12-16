import 'package:remote_controller/business_logic/command.dart';
import 'package:remote_controller/devices/ceiling_fan.dart';

class CeilingFanOffCommand implements Command {
  final CeilingFan _fan;

  CeilingFanOffCommand({
    required CeilingFan fan,
  }) : _fan = fan;

  @override
  void execute() {
    _fan.off();
  }
}
