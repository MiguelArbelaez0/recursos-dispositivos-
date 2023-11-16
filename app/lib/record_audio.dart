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

  bool showPlayer = false;

  String? audiopath;

  Future startrecordAudio() async {
    await record.start(const RecordConfig(), path: 'aFullPath/myFile.m4a');
  }

  Future stoprecordAudio() async {
    final path = await record.stop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: showPlayer
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: AudioPlayer(
                    source: audioPath!,
                    onDelete: () {
                      setState(() => showPlayer = false);
                    },
                  ),
                )
              : Recorder(
                  onStop: (path) {
                    if (kDebugMode) print('Recorded file path: $path');
                    setState(() {
                      audioPath = path;
                      showPlayer = true;
                    });
                  },
                ),
        ),
      ),
    );
  }
}
