import 'package:flutter/material.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'Home';
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Dark mode: ${Preferences.isDarkmode}', style: textStyle),
          const Divider(),
          Text('Genero: ${Preferences.gender}', style: textStyle),
          const Divider(),
          Text('Nombre de usuario: ${Preferences.name}', style: textStyle),
          const Divider()
        ],
      )
    );
  }
}