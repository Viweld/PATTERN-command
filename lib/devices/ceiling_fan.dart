import 'package:remote_controller/main.dart';

class CeilingFan {
  int _speed;

  CeilingFan({
    int? speed,
  })  : _speed = speed ?? 0;

  int get getSpeed => _speed;

  void low() {
    _speed = 1;
    log.d('Вентилятор стал вращаться так что вы ощутили легкий ветерок');
  }

  void medium() {
    _speed = 2;
    log.d('Вентилятор стал вращаться так что начали качаться зановески');
  }

  void high() {
    _speed = 3;
    log.d('Вентилятор стал вращаться слишком быстро. Сдуло ваш парик)))');
  }

  void off() {
    _speed = 0;
    log.d('Вентилятор выключен');
  }
}
