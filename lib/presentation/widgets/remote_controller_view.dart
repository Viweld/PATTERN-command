import 'package:flutter/material.dart';
import 'package:remote_controller/presentation/widgets/remote_loader.dart';

class RemoteControllerView extends StatelessWidget {
  const RemoteControllerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final remoteController = RemoteLoader.of(context)!.remoteController;
    final slotCount = remoteController.slotsCount;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < slotCount; i++)
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => remoteController.onButtonWasPushed(i),
                  child: const Text('ON'),
                ),
                ElevatedButton(
                  onPressed: () => remoteController.offButtonWasPushed(i),
                  child: const Text('OFF'),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
