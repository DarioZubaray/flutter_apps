import 'package:flutter/material.dart';
import 'package:fl_components/models/models.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'listview1',
        icon: Icons.list,
        name: 'List View',
        screen: const Listview1Screen()),
    MenuOption(
        route: 'alert',
        icon: Icons.add_alert,
        name: 'Alerts',
        screen: const AlertScreen()),
    MenuOption(
        route: 'card',
        icon: Icons.credit_card,
        name: 'Cards',
        screen: const CardScreen()),
    MenuOption(
        route: 'avatar',
        icon: Icons.supervised_user_circle_outlined,
        name: 'Avatars',
        screen: const AvatarScreen()),
    MenuOption(
        route: 'animated',
        icon: Icons.play_arrow_outlined,
        name: 'Animated Container',
        screen: const AnimatedScreen()),
    MenuOption(
        route: 'inputs',
        icon: Icons.input_rounded,
        name: 'Text Inputs',
        screen: const InputsScreen()),
    MenuOption(
        route: 'slider-checks',
        icon: Icons.slow_motion_video_outlined,
        name: 'Slider & Checks',
        screen: const SliderScreen()),
    MenuOption(
        route: 'listview-builder',
        icon: Icons.build_circle_rounded,
        name: 'Infinity Scroll & Pull 2 refresh ',
        screen: const ListViewBuilderScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  static Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
    print('$settings');
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  };
}
