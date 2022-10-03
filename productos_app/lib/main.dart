import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ProductService()),
        ChangeNotifierProvider(create: (_)=> AuthService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos App',
      initialRoute: LoginScreen.routeName,
      routes: {
        CheckAuthScreen.routeName: (_) => const CheckAuthScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),

        HomeScreen.routeName: (_) => const HomeScreen(),
        ProductScreen.routeName: (_) => const ProductScreen(),
      },
      scaffoldMessengerKey: NotificationService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.indigo
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 0
        )
      ),
    );
  }
}