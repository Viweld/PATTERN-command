import 'package:flutter/material.dart';
import 'package:remote_controller/widgets/remote_loader.dart';
import 'package:remote_controller/widgets/indicators_view.dart';
import 'package:remote_controller/widgets/remote_controller_view.dart';

class MySystemScreen extends StatefulWidget {
  const MySystemScreen({Key? key}) : super(key: key);

  @override
  State<MySystemScreen> createState() => _MySystemScreenState();
}

class _MySystemScreenState extends State<MySystemScreen> {
  bool isInit = false;

  @override
  void didChangeDependencies() {
    if (!isInit) {
      RemoteLoader.of(context)?.initRemote();
      isInit = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('RemoteController'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            IndicatorsView(),
            RemoteControllerView(),
          ],
        ),
      ),
    );
  }
}
