import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PlaneAnimation extends StatefulWidget {
  const PlaneAnimation(
      {super.key,
      this.height,
      this.width,
      this.bottom,
      this.left,
      this.isTop = false});
  final double? height;
  final double? width;
  final double? bottom;
  final double? left;
  final bool? isTop;

  @override
  State<PlaneAnimation> createState() => _PlaneAnimationState();
}

class _PlaneAnimationState extends State<PlaneAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        // double value = _controller.value * (size.width - 200);
        double left = _controller.value * (size.width * 0.15);
        double bottom =
            _controller.value * (size.height * (widget.isTop! ? 0.85 : 0.5));
        return Positioned(
          left: left,
          bottom: bottom,
          // bottom: widget.bottom ?? 10,
          child: SizedBox(
            height: widget.height ?? 160,
            width: widget.width ?? 160,
            child: Lottie.asset(
              'assets/animations/lottie/paper.json',
              controller:
                  _controller, // Use the controller with Lottie animation
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Always dispose of controllers to prevent memory leaks
    super.dispose();
  }
}
