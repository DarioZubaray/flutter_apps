import 'package:flutter/material.dart';
import 'package:my_app/screens/custom_floating_action_button.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 10;
  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const whiteFontSize40 = TextStyle(color: Colors.white, fontSize: 40);
    const greyFontSize35 = TextStyle(color: Colors.grey, fontSize: 35);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 5,
        title: const Text('El contador achaval'),
      ),
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hola Juli',
              style: whiteFontSize40,
            ),
            Text(
              '$counter',
              style: greyFontSize35,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButton(
          increaseFn: increase, decreaseFn: decrease, resetFn: reset),
    );
  }
}
