import 'package:remote_controller/domain/use_cases/no_command.dart';
import 'package:test/test.dart';

void main() {
  test('Тестирование null-object - команды', (){
    final noCommand = NoCommand();
    noCommand.execute();
    noCommand.undo();
  });
}

