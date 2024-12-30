import 'dart:ui';

import 'package:flutter/material.dart';

class TransformedGlassWidget extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;
  final Matrix4 transform;
  final AlignmentGeometry? alignment;

  const TransformedGlassWidget({
    super.key,
    required this.width,
    required this.height,
    required this.transform,
    this.child,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: transform,
      alignment: alignment,
      child: GlassWidget(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}

class GlassWidget extends StatelessWidget {
  const GlassWidget({
    super.key,
    required this.height,
    required this.width,
    this.child,
  });

  final double height;
  final double width;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 14,
                sigmaY: 14,
              ),
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  Colors.white.withOpacity(0.4),
                  Colors.white.withOpacity(0.2),
                ]),
              ),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
