import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:opexq/utils/utils.dart';

class AudioView extends StatefulWidget {
  const AudioView({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<StatefulWidget> createState() {
    return _AudioView();
  }
}

class _AudioView extends State<AudioView> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    player = AudioPlayer();
    player.setUrl(widget.url);

    // await Future.wait(player.load());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 2.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                  child: player.playing
                      ? const Text("Playing")
                      : showBusyIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
