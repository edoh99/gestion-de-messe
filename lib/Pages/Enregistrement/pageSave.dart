import 'package:flutter/material.dart';
import 'package:gestion_eglise/Pages/Enregistrement/sound_recorder.dart';
import 'package:gestion_eglise/Widgets/timer_widget.dart';

class SaveCultes extends StatefulWidget {
  SaveCultes({Key? key}) : super(key: key);

  @override
  _SaveCultesState createState() => _SaveCultesState();
}

class _SaveCultesState extends State<SaveCultes> {
  final timerController = TimerController();
  final recorder = SoundRecorder();

  @override
  void initState() {
    super.initState();
    recorder.dispose();
  }

  @override
  void dispose() {
    super.dispose();
    recorder.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
          'Enregistrement des cultes',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildPlayer(),
            SizedBox(height: 16),
            buildStart(),
          ],
        ),
      ),
    );
  }

  Widget buildStart() {
    final isRecording = recorder.isRecording;
    final text = isRecording ? 'ARRÊTER' : 'DÉBUT';
    final icon = isRecording ? Icons.stop : Icons.mic;
    final primary = isRecording ? Colors.red : Colors.white;
    final onPrimary = isRecording ? Colors.white : Colors.black;

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(175, 50),
        primary: primary,
        onPrimary: onPrimary,
      ),
      onPressed: () async {
        await recorder.toggleRecording();
        final isRecording = recorder.isRecording;
        setState(() {});

        if (isRecording) {
          timerController.startTimer();
        } else {
          timerController.stopTimer();
        }
      },
      icon: Icon(icon),
      label: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildPlayer() {
    final text =
        recorder.isRecording ? 'Enregistrement en cours' : 'Appuyez sur Start';

    return CircleAvatar(
      radius: 10,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 92,
        backgroundColor: Colors.teal.shade900.withBlue(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mic, size: 32),
            // TimerWidget(controller: timerController),
            SizedBox(height: 8),
            Text(text),
          ],
        ),
      ),
    );
  }
}
