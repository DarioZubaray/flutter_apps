import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [

        TableRow(
          children: [
            _SingleCard(title: 'General', icon: Icons.border_all, color: Colors.blue),
            _SingleCard(title: 'Transport', icon: Icons.car_rental, color: Colors.deepPurple),
          ]
        ),

        TableRow(
          children: [
            _SingleCard(title: 'Shopping', icon: Icons.shop, color: Colors.pink),
            _SingleCard(title: 'Bill', icon: Icons.blinds, color: Colors.amber),
          ]
        ),

        TableRow(
          children: [
            _SingleCard(title: 'Safety', icon: Icons.safety_check, color: Colors.green),
            _SingleCard(title: 'Movie', icon: Icons.movie, color: Colors.cyan),
          ]
        ),

        TableRow(
          children: [
            _SingleCard(title: 'Baby Changing', icon: Icons.baby_changing_station, color: Colors.brown),
            _SingleCard(title: 'Ice Skating', icon: Icons.ice_skating, color: Colors.lime),
          ]
        ),

      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;

  const _SingleCard({super.key, required this.title, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {

    return _CardBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(icon, size: 35, color: Colors.white),
          ),
  
          const SizedBox(height: 10,),
          Text(title, style: TextStyle(color: color, fontSize: 18))
        ],
      )
    );
  }
}

class _CardBackground extends StatelessWidget {

  final Widget child;

  const _CardBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20)
            ),
            child: child,
          ),
        ),
      ),
    );;
  }
}