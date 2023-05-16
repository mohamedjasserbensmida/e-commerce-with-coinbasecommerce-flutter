import 'package:flutter/material.dart';

class AnimatedTextScrolling extends StatefulWidget {
  @override
  _AnimatedTextScrollingState createState() => _AnimatedTextScrollingState();
}

class _AnimatedTextScrollingState extends State<AnimatedTextScrolling>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final String _text = "Paiement avec succès !";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 100.0,
              color: Colors.white,
            ),
            SizedBox(height: 20.0),
            Text(
              "Paiement avec succès !",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
