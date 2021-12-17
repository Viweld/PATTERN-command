import 'package:remote_controller/domain/entities/ceiling_fan.dart';
import 'package:remote_controller/domain/entities/garage_door.dart';
import 'package:remote_controller/domain/entities/light.dart';
import 'package:remote_controller/domain/entities/stereo.dart';
import 'package:test/test.dart';

void main() {
  test('Тестирование света в Спальне', () {
    Light livingRoomLight = Light(location: 'Спальня');
    livingRoomLight.on();
    expect(livingRoomLight.isIlluminated, true);
    livingRoomLight.off();
    expect(livingRoomLight.isIlluminated, false);
  });

  test('Тестирование света в кухне', () {
    Light kitchenLight = Light(location: 'Кухня');
    kitchenLight.on();
    expect(kitchenLight.isIlluminated, true);
    kitchenLight.off();
    expect(kitchenLight.isIlluminated, false);
  });

  test('Тестирование вентилятора', () {
    CeilingFan ceilingFan = CeilingFan();
    ceilingFan.low();
    expect(ceilingFan.getSpeed, 1);
    ceilingFan.medium();
    expect(ceilingFan.getSpeed, 2);
    ceilingFan.high();
    expect(ceilingFan.getSpeed, 3);
    ceilingFan.off();
    expect(ceilingFan.getSpeed, 0);
  });

  test('Тестирование гаражных ворот', () {
    GarageDoor garageDoor = GarageDoor();
    garageDoor.up();
    expect(garageDoor.isOpened, true);
    garageDoor.down();
    expect(garageDoor.isOpened, false);
    garageDoor.lightOn();
    expect(garageDoor.isIlluminated, true);
    garageDoor.lightOff();
    expect(garageDoor.isIlluminated, false);
  });

  test('Тестирование стереосистемы', () {
    Stereo stereo = Stereo();
    stereo.on();
    expect(stereo.isOn, true);
    stereo.setCd();
    expect(stereo.audioSource, AudioSource.cd);
    for (int i = -1; i <= 31; i++) {
      stereo.setVolume(i);
      expect(stereo.volume,i);
    }
    stereo.setDvd();
    expect(stereo.audioSource, AudioSource.dvd);
    for (int i = -1; i <= 31; i++) {
      stereo.setVolume(i);
      expect(stereo.volume,i);
    }
    stereo.setRadio();
    expect(stereo.audioSource, AudioSource.radio);
    for (int i = -1; i <= 31; i++) {
      stereo.setVolume(i);
      expect(stereo.volume,i);
    }
    stereo.off();
    expect(stereo.isOn, false);
  });
}
