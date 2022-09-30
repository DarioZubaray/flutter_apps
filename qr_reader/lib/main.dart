import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        ChangeNotifierProvider(create: (_) => UIProvider() ),
        ChangeNotifierProvider(create: (_) => ScanListProvider() ),
      ],

      child: MaterialApp(
        title: 'QR Reader App',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
          'map': (_) => const MapScreen()
        },

        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.deepPurple,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurpleAccent),
          appBarTheme: const AppBarTheme(color: Colors.deepPurple),
          iconTheme: const IconThemeData(
            color: Colors.deepPurple
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple
          )
        ),
    
      ),
    );
  }
}
