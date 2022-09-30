import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Widget'),
        ),

        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            CustomCardType1(),
            SizedBox(height: 10),
            CustomCardType2(
              imageUrl:
                  'https://static.wikia.nocookie.net/kirby/images/2/2d/Kirby_y_bandana_dee_flotando.jpg',
              subtitle: 'Kirby y el wadle dee de pañuelo flotando',
            ),
            SizedBox(height: 10),
            CustomCardType2(
                imageUrl: 'https://pbs.twimg.com/media/FI6TsmGWUAEB9U_.png'),
            SizedBox(height: 10),
            CustomCardType2(
              imageUrl:
                  'https://nintenduo.com/wp-content/uploads/2022/01/Kirby.webp',
              subtitle: 'Poderes de kirby',
            ),
            SizedBox(height: 100),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (await Permission.contacts.request().isGranted) {
              // Either the permission was already granted before or the user just granted it.
            }
          },
          child: const Icon(Icons.perm_scan_wifi),
        ),
      );
  }
}
