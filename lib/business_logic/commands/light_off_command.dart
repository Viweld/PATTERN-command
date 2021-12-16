import 'package:remote_controller/devices/light.dart';
import 'package:remote_controller/business_logic/command.dart';

class LightOffCommand implements Command {
  final Light _light;

  LightOffCommand({
    required Light light,
  }) : _light = light;

  @override
  void execute() {
    _light.off();
  }
}
