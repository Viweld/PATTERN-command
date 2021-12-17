
import 'package:remote_controller/domain/command.dart';
import 'package:remote_controller/domain/entities/stereo.dart';

class StereoOffCommand implements Command {
  static late bool _prevState;
  static late int _prevVol;
  static late AudioSource _prevSource;

  final Stereo _stereo;

  StereoOffCommand({
    required Stereo stereo,
  }) : _stereo = stereo {
    _prevState = _stereo.isOn;
    _prevVol = _stereo.volume;
    _prevSource = _stereo.audioSource;
  }

  @override
  void execute() {
    _prevState = _stereo.isOn;
    _prevVol = _stereo.volume;
    _prevSource = _stereo.audioSource;
    _stereo.off();
  }

  @override
  void undo() {
    switch (_prevState) {
      case true:
        _stereo.on();
        break;
      case false:
        _stereo.off();
        break;
    }

    _stereo.setVolume(_prevVol);

    switch (_prevSource) {
      case AudioSource.cd:
        _stereo.setCd();
        break;
      case AudioSource.dvd:
        _stereo.setDvd();
        break;
      case AudioSource.radio:
        _stereo.setRadio();
        break;
    }
  }
}
