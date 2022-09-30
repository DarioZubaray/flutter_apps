import 'package:fl_components/themes/themes.dart';
import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  final games = const [
    'Pokemon Let\'s go pikachu',
    'Pokemon Sword',
    'The Legend of Zelda: Breath of the wild',
    'Pokemon Brilliant Diamond',
    'Mortal kombat 11',
    'Diablo 2',
    'Diablo 3',
    'Animal Crossing New Horizon',
    'Pokemon Legends Arceus',
    'Super Mario Odissey',
    'Kirby and the forgotten lands',
    'Kirby dream buffet',
    'Crash Bandicoot N sane trilogy',
    'Spyro Reignite trilogy',
    '---Proximamente---',
    'The Legend of zelda: Links awakening',
    'Super Mario 3d world + bowser fury',
    'Pokemon Violet',
    'Crash badicoot 4 its about time',
    'Kirby return to dreamland deluxe',
    'The Legend of zelda: Tears of the kingdom',
  ];
  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nintendo Games'),
      ),
      body: ListView.separated(
        itemCount: games.length,
        itemBuilder: (_, index) {
          return ListTile(
            leading: Icon(
              Icons.ac_unit_sharp,
              color: AppTheme.primary,
            ),
            title: Text(games[index]),
            trailing: Icon(
              Icons.arrow_right,
              color: AppTheme.primary,
            ),
            onTap: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('You choose'),
                content: Text(games[index]),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
