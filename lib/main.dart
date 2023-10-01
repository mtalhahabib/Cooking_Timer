import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/view/timerHome.dart';
import 'package:timer/viewModel/timerViewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                TimerViewModel()), // Using ChangeNotifierProvider
        // Other providers if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
              .copyWith(background: Colors.purple),
          primarySwatch: Colors.deepPurple,
          useMaterial3: true,
        ),
        home: const TimerHome(),
      ),
    );
  }
}
