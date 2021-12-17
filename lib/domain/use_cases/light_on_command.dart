import 'package:remote_controller/domain/command.dart';
import 'package:remote_controller/domain/entities/light.dart';

class LightOnCommand implements Command {
  static late bool _prevState;
  final Light _light;

  bool get prevState => _prevState;

  LightOnCommand({
    required Light light,
  }) : _light = light {
    _prevState = _light.isIlluminated;
  }

  @override
  void execute() {
    _prevState = _light.isIlluminated;
    _light.on();
  }

  @override
  void undo() {
    switch (_prevState) {
      case true:
        _light.on();
        break;
      case false:
        _light.off();
        break;
    }
  }
}
