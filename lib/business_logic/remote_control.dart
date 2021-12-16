import 'package:remote_controller/business_logic/command.dart';

import 'commands/no_command.dart';

///Класс пульта управления на 7 слотов
class RemoteControll {
  List<Command> _onCommands = [];
  List<Command> _offCommands = [];

  ///Конструктор, создающий экземпляр пульта на 7 слотов
  RemoteControll() {
    for (int i = 0; i < 7; i++) {
      _onCommands.add(NoCommand());
      _offCommands.add(NoCommand());
    }
  }

  ///Метод подключения переферийного устройства к i-му слоту
  ///и назначения действий на кнопки
  void setCommand(
    int slot,
    Command onCommand,
    Command offCommand,
  ) {
    _onCommands[slot] = onCommand;
    _offCommands[slot] = offCommand;
  }

  ///Метод, реализующий действие по нажатию на кнопку "ON"
  void onButtonWasPushed(int slot) {
    _onCommands[slot].execute();
  }

  ///Метод, реализующий действие по нажатию на кнопку "OFF"
  void offButtonWasPushed(int slot) {
    _offCommands[slot].execute();
  }
}
