import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class FloatingAction extends StatelessWidget {
  const FloatingAction({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: const Color.fromRGBO(249, 187, 47, 1),
      onPressed: () {},
      child: const Icon(
        Icons.add,
        size: 30,
        color: Colors.black,
      ), //icon inside button
    );
  }
}
