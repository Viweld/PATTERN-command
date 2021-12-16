import 'package:remote_controller/main.dart';

enum AudioSource {
  cd,
  dvd,
  radio,
}

class Stereo {
  int _volume;
  AudioSource _audioSource;

  Stereo({
    int? speed,
    AudioSource? audioSource,
  })  : _audioSource = audioSource ?? AudioSource.radio,
        _volume = speed ?? 0;

  int get volume => _volume;

  String get audioSource => _audioSource.toString();

  void on() {
    log.d('Где-то тихо щелкнуло');
  }

  void off() {
    _volume = 0;
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

    if (_volume == 0) {
      log.d('Стало совсем тихо...');
    } else if (_volume < 10) {
      log.d('Зазвучал $sourseMsg');
    } else if (_volume >= 10 && _volume < 20) {
      log.d('Вас оглушил $sourseMsg');
    } else if (_volume >= 10 && _volume < 20) {
      log.e(
          'От внезапного рева треснуло окно. На весь дом орал, разрывая ваши барабанные перепонки $sourseMsg');
    }
  }
}
