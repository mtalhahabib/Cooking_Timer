import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/viewModel/timerViewModel.dart';

class TimerHome extends StatelessWidget {
  const TimerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Cooking Timer',style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          
          PopupMenuButton<String>(
            icon: Icon(Icons.restore),
            onSelected: (value) {
              context.read<TimerViewModel>().setTimerValue(value);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: '1 Hour',
                child: Text('1 Hour'),
              ),
              PopupMenuItem<String>(
                value: '30 Minutes',
                child: Text('30 Minutes'),
              ),
              PopupMenuItem<String>(
                value: '15 Minutes',
                child: Text('15 Minutes'),
              ),
              PopupMenuItem<String>(
                value: '5 Minutes',
                child: Text('5 Minutes'),
              ),
              PopupMenuItem<String>(
                value: '5 Seconds',
                child: Text('5 Seconds'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: Consumer<TimerViewModel>(
              builder: (_, val, __) => Text(
                '${val.duration.toString()}',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.purple),
                  shadowColor:
                      MaterialStateColor.resolveWith((states) => Colors.grey),
                  minimumSize: MaterialStateProperty.resolveWith(
                      (states) => const Size(200, 80)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))))),
              onPressed: () {
                context.read<TimerViewModel>().startTimer(context);
              },
              child: Text(
                "Start",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
        ],
      )),
    );
  }
}
