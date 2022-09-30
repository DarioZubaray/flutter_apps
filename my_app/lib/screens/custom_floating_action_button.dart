import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const CustomFloatingActionButton(
      {Key? key,
      required this.increaseFn,
      required this.decreaseFn,
      required this.resetFn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 25),
        FloatingActionButton(
          onPressed: () => resetFn(),
          child: const Icon(Icons.card_travel_outlined),
        ),
        const SizedBox(width: 25),
        FloatingActionButton(
          onPressed: () => increaseFn(),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
