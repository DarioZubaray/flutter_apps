import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/services/services.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});

  static const String routeName = 'checking';

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: FutureBuilder(
        future: authService.verifyToken(),
        builder: (_, AsyncSnapshot<String> snapshot) {
          if (!snapshot.hasData) {
           const Text('Espere por favor');
          }

          if (snapshot.data == '') {
            Future.microtask(() {
              Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const LoginScreen(),
                  transitionDuration: const Duration(seconds: 0)
                )
              );
            });
          } else {
            Future.microtask(() {
              Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const HomeScreen(),
                  transitionDuration: const Duration(seconds: 0)
                )
              );
            });
          }

          return Container();
        }),
      );
  }
}