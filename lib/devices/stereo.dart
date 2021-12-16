import 'package:remote_controller/main.dart';

enum AudioSource {
  cd,
  dvd,
  radio,
}

class Stereo {
  int _volume;
  bool _isOn;
  AudioSource _audioSource;

  Stereo({
    int? speed,
    bool? isOn,
    AudioSource? audioSource,
  })  : _audioSource = audioSource ?? AudioSource.radio,
        _volume = speed ?? 0,
        _isOn = isOn ?? false;

  bool get isOn => _isOn;

  int get volume => _volume;

  AudioSource get audioSource => _audioSource;

  void on() {
    _isOn=true;
    log.d('Где-то тихо щелкнуло');
  }

  void off() {
    _volume = 0;
    _isOn=false;
    log.d('Стало совсем тихо...');
  }

  void setCd() {
    _audioSource = AudioSource.cd;
    log.d('Где-то тихо щелкнуло');
  }

  void setDvd() {
    _audioSource = AudioSource.dvd;
    log.d('Где-то тихо щелкнуло');
  }

  void setRadio() {
    _audioSource = AudioSource.radio;
    log.d('Где-то тихо щелкнуло');
  }

  void setVolume(int vol) {
    _volume = vol;
    var sourseMsg = '';
    switch (_audioSource) {
      case AudioSource.cd:
        sourseMsg = 'голос старого-доброго Элвиса.';
        break;
      case AudioSource.dvd:
        sourseMsg = 'визг Чужего. Вы вспомнили, что забыли включить телевизор';
        break;
      case AudioSource.radio:
        sourseMsg =
            'голос известного комментатора. Турнир по шашкам был в самом разгаре';
        break;
    }

    if (_volume <= 0) {
      log.d('Стало совсем тихо...');
    } else if (_volume < 10) {
      log.d('Зазвучал $sourseMsg');
    } else if (_volume >= 10 && _volume < 20) {
      log.d('Вас оглушил $sourseMsg');
    } else if (_volume >= 20 && _volume < 30) {
      log.w(
          'От внезапного рева треснуло окно. На весь дом орал, разрывая ваши барабанные перепонки $sourseMsg');
    } else {
      log.w('Вокруг очень шумно, но громче уже не делается');
    }
  }
}
