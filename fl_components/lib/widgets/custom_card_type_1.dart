import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: AppTheme.primary),
            title: const Text('Soy un titulo'),
            subtitle: const Text(
                'Labore cillum officia ullamco pariatur minim minim enim culpa culpa laborum irure. Excepteur laboris culpa aute consequat culpa enim ullamco do occaecat commodo excepteur ea deserunt. Amet laboris adipisicing magna ullamco exercitation est ipsum elit qui. Mollit voluptate commodo ea sit velit tempor et anim laboris amet commodo.'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: const Text('Cancel')),
                TextButton(onPressed: () {}, child: const Text('Ok')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
