import 'package:remote_controller/business_logic/command.dart';
import 'package:remote_controller/devices/stereo.dart';

class StereoOnCommand implements Command{
  final Stereo _stereo;

  StereoOnCommand({
    required Stereo stereo,
  }) : _stereo = stereo;

  @override
  void execute() {
    _stereo.on();
    _stereo.setCd();
    _stereo.setVolume(11);
  }
}