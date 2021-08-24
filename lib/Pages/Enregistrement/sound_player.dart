// import 'package:flutter/cupertino.dart';
// import 'package:flutter_sound_lite/public/flutter_sound_player.dart';

// final pathToReadAudio = 'audio_exemple.aac';

// class SoundPlayer {
//   FlutterSoundPlayer? _audioPayer;
//   bool get isPlaying => _audioPayer!.isPlaying;

//   Future init() async {
//     _audioPayer = FlutterSoundPlayer();

//     await _audioPayer!.openAudioSession();
//   }

//   void dispose() {
//     _audioPayer!.closeAudioSession();
//     _audioPayer = null;
//   }

//   Future _play(VoidCallback whenFinished) async {
//     await _audioPayer!.startPlayer(
//       fromURI: pathToReadAudio,
//       whenFinished: whenFinished,
//     );
//   }

//   Future _stop() async {
//     await _audioPayer!.stopPlayer();
//   }

//   Future togglePlaying({VoidCallback? whenFinished}) async {
//     if (_audioPayer!.isStopped) {
//       await _play(whenFinished!);
//     } else {
//       await _stop();
//     }
//   }
// }
