import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.pink,
      backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: const Color.fromRGBO(116, 117,152, 1),
      items: const [
        BottomNavigationBarItem(
          label: 'calendario',
          icon: Icon(Icons.calendar_today_outlined, size: 30,)
        ),

        BottomNavigationBarItem(
          label: 'Gráfica',
          icon: Icon(Icons.pie_chart_outline_outlined)
        ),

        BottomNavigationBarItem(
          label: 'Usuarios',
          icon: Icon(Icons.supervised_user_circle_outlined)
        ),
      ],
    );
  }
}