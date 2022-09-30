import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: ElevatedButton(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Mostrar alerta', style: TextStyle(fontSize: 25)),
            ),
            onPressed: () => Platform.isAndroid
              ? displayDialogAndroid(context) 
              : displayDialogIos(context),
        ),
      ),

      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context)
      ),
    );
  }

  void displayDialogIos(BuildContext context) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Ios Alert'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const[
              Text('Este es el contenido de una alerta de ios con el estilo de cupertino.'),
              SizedBox(height: 10),
              FlutterLogo(size: 100)
            ]
          ),

          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        );
      }
    );
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {

        return AlertDialog(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15)),
          title: const Text('AlertDialog Title'),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
               Text('AlertDialog description'),
               SizedBox(height: 10),
               FlutterLogo(size: 100)
            ],
          ),

          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],

        );
      },
    );
  }

}
