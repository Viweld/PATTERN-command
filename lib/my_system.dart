import 'package:flutter/material.dart';
import 'package:remote_controller/data_injector.dart';
import 'package:remote_controller/indicators.dart';
import 'package:remote_controller/remote_controller.dart';

class MySystem extends StatefulWidget {
  const MySystem({Key? key}) : super(key: key);

  @override
  State<MySystem> createState() => _MySystemState();
}

class _MySystemState extends State<MySystem> {
  bool isInit = false;

  @override
  void didChangeDependencies() {
    if(!isInit){
      DataInjector.of(context)?.initRemote();
      isInit=true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final remoteController = DataInjector.of(context)!.remoteControler;

    return Scaffold(
      appBar: AppBar(
        title: const Text('RemoteController'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: const [
            Indicators(),
            RemoteController(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => remoteController.onButtonWasPushed(1)),
    );
  }
}
