import 'package:flutter/material.dart';

import 'package:disenios/screens/screens.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      title: 'Diseños',
      theme: ThemeData.dark(),
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'basic_design': (_) => const BasicDesignScreen(),
        'scroll_design': (_) => const ScrollScreen(),
        'advanced_design':(_) => const AdvancedScreen()
      },
    );
  }
}

// Extraer a creacion de un widget en una clase widget
class _TempHomeScreen extends StatelessWidget {
  const _TempHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Hello World'),
            Text('Hello World'),
          ],
        ),
      );
  }
}