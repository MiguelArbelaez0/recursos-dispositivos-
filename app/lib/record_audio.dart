import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';

class RecordAudioScreeen extends StatefulWidget {
  const RecordAudioScreeen({super.key});

  @override
  State<RecordAudioScreeen> createState() => _RecordAudioScreeenState();
}

class _RecordAudioScreeenState extends State<RecordAudioScreeen> {
  final record = AudioRecorder();

  final player = AudioPlayer();

  late final String? pathAudio;

  Future<void> startrecordAudio() async {
    if (await record.hasPermission()) {
      final stream = await record.startStream(const RecordConfig());
    }
  }

  Future<void> stoprecordAudio() async {
    pathAudio = await record.stop();
    print(pathAudio);
  }

  Future<void> playrecordAduio() async {
    await player.play(DeviceFileSource(pathAudio!));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await startrecordAudio();
                  },
                  child: Text("start")),
              ElevatedButton(
                  onPressed: () async {
                    await stoprecordAudio();
                  },
                  child: Text("stop")),
              ElevatedButton(
                  onPressed: () async {
                    await playrecordAduio();
                  },
                  child: Text("play")),
            ],
          ),
        ),
      ),
    );
  }
}
