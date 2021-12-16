import 'package:remote_controller/business_logic/command.dart';
import 'package:remote_controller/devices/stereo.dart';

class StereoOffCommand implements Command{
  final Stereo _stereo;

  StereoOffCommand({
    required Stereo stereo,
  }) : _stereo = stereo;

  @override
  void execute() {
    _stereo.off();
  }
}