import 'package:remote_controller/business_logic/command.dart';
import 'package:remote_controller/devices/light.dart';

class LightOnCommand implements Command {
  final Light _light;

  LightOnCommand({
    required Light light,
  }) : _light = light;

  @override
  void execute() {
    _light.on();
  }
}
