import 'package:flutter/material.dart';
import 'dart:math' show pi;

class View1Screen extends StatefulWidget {
  const View1Screen({super.key});

  @override
  State<View1Screen> createState() => _View1ScreenState();
}

class _View1ScreenState extends State<View1Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              alignment: AlignmentDirectional.center,
              transform: Matrix4.identity()..rotateY(_animation.value),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 7,
                          spreadRadius: 5,
                          offset: const Offset(0, 3))
                    ]),
                child: const Center(child: Text("HI")),
              ),
            );
          },
        ),
      ),
    );
  }
}
