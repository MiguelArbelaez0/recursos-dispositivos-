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

  Future<void> startrecordAudio() async {}

  Future<void> stoprecordAudio() async {}

  Future<void> playrecordAduio() async {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}
