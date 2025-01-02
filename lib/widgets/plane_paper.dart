import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PlanePaperAnimation extends StatefulWidget {
  const PlanePaperAnimation(
      {super.key, this.height, this.width, this.bottom, this.left});
  final double? height;
  final double? width;
  final double? bottom;
  final double? left;

  @override
  State<PlanePaperAnimation> createState() => _PlanePaperAnimationState();
}

class _PlanePaperAnimationState extends State<PlanePaperAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat(); // This will make the animation repeat continuously
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        // double value = _controller.value * (size.width - 200);
        double right = _controller.value * (size.width * 0.12);
        double top = _controller.value * (size.height * 0.15);
        return Positioned(
          // duration: const Duration(seconds: 5),
          right: right,
          top: top,
          // bottom: widget.bottom ?? 10,
          child: SizedBox(
            height: widget.height ?? 240,
            width: widget.width ?? 240,
            child: Lottie.asset(
              'assets/animations/lottie/plane_paper.json',
              controller:
                  _controller, // Use the controller with Lottie animation
              fit: BoxFit.fill,
              // repeat: false,
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
