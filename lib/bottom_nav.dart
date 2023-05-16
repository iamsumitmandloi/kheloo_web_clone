import 'package:flutter/material.dart';
import 'dart:math' as math;

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Row(
        //children inside bottom appbar
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const TrapezoidContainer(
            icon: Icons.volume_up_outlined,
            title: "Support",
            isLeft: true,
          ),
          SizedBox(
            height: 80,
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.sports_football_outlined,
                    size: 30,
                    color: Color.fromRGBO(249, 187, 47, 1),
                  ),
                  onPressed: () {},
                ),
                const Text(
                  'Sports',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.money,
                    size: 30,
                    color: Color.fromRGBO(249, 187, 47, 1),
                  ),
                  onPressed: () {},
                ),
                Text(
                  'Live Casino',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const TrapezoidContainer(
            icon: Icons.person_2_outlined,
            title: "Register",
            isLeft: false,
          ),
        ],
      ),
    );
  }
}

class TrapezoidContainer extends StatelessWidget {
  const TrapezoidContainer(
      {super.key,
      required this.icon,
      required this.title,
      required this.isLeft});
  // final Widget child;
  final bool isLeft;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: isLeft ? TrapezoidClipperLeft() : TrapezoidClipperRight(),
      child: Container(
        color: const Color.fromRGBO(249, 187, 47, 1),
        height: 100,
        width: 100,
        child: Column(
          children: [
            IconButton(
              icon: Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 4),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrapezoidClipperLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(size.width * 0.75, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class TrapezoidClipperRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0); // Adjust the width reduction here
    path.lineTo(25, 0); // Adjust the width reduction here
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
