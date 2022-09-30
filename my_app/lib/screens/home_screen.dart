import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const whiteFontSize40 = TextStyle(color: Colors.white, fontSize: 40);
    const greyFontSize35 = TextStyle(color: Colors.grey, fontSize: 35);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 5,
        title: const Text('Bienvenidos a Flutter'),
      ),
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Hola Juli',
              style: whiteFontSize40,
            ),
            Text(
              'como estas?',
              style: greyFontSize35,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showToast(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
