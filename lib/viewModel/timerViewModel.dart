import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class TimerViewModel extends ChangeNotifier {
  String _timer = '1 Hour';
  String get timerValue => _timer;

  Duration startTime = Duration(hours: 01, minutes: 00, seconds: 00);

  String get duration => formatDuration(startTime);

  String formatDuration(Duration duration) {
    return '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  AudioPlayer audioPlayer = AudioPlayer();
  void startTimer(context) {
    // Create a timer that ticks every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (startTime.inSeconds > 0) {
        startTime -= Duration(seconds: 1);
        notifyListeners();
      } else {
        timer.cancel();
        alaram();
        DialogBox(context);
        getTimerValue();
        notifyListeners(); // Stop the timer when startTime reaches zero
      }
    });
  }

  void setTimerValue(value) {
    _timer = value;
    getTimerValue();
    notifyListeners();
  }

  void getTimerValue() {
    if (_timer == '1 Hour') {
      startTime = Duration(hours: 01, minutes: 00, seconds: 00);
      notifyListeners();
    } else if (_timer == '30 Minutes') {
      startTime = Duration(hours: 00, minutes: 30, seconds: 00);
      notifyListeners();
    } else if (_timer == '15 Minutes') {
      startTime = Duration(hours: 00, minutes: 15, seconds: 00);

      notifyListeners();
    } else if (_timer == '5 Minute') {
      startTime = Duration(hours: 00, minutes: 05, seconds: 00);
      notifyListeners();
    } else if (_timer == '5 Seconds') {
      startTime = Duration(hours: 00, minutes: 00, seconds: 05);
      notifyListeners();
    }
  }

  void DialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Time Finished',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'Click OK to stop the Alarm',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.white)),
              onPressed: () {
                audioPlayer.pause();
                audioPlayer.stop();
                notifyListeners();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void alaram() {
    
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPlayer.play(AssetSource('kookwekker.mp3'), volume: 150.0);
  }
}
