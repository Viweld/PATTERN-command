import 'package:remote_controller/domain/command.dart';
import 'package:remote_controller/main.dart';

class NoCommand implements Command{

  @override
  void execute() {
    log.w('null-объект NoCommand выполнил свой execute()');
  }

  @override
  void undo() {
    log.w('null-объект NoCommand выполнил свой undo()');
  }

}