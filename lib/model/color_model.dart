import 'package:flutter/material.dart';

class ColorModel {
  final String svgPath;
  final Color color;
  final Gradient gradient;

  ColorModel({
    required this.svgPath,
    required this.color,
    required this.gradient,
  });
}

List<ColorModel> colorPalette = [
  ColorModel(
    svgPath: "assets/svg/cloudRed.svg",
    color: const Color(0xFF7F7FD5),
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      // transform: Grad,
      end: Alignment.topRight,
      colors: [
        const Color(0xFF7F7FD5),
        const Color(0xFF86A8E7),
        const Color(0xFFec2F4B).withOpacity(0.7)
      ],
    ),
  ),
  ColorModel(
    svgPath: "assets/svg/Cloudy_dark.svg",
    color: Colors.blue,
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      colors: [Colors.blue, Colors.black45], // Color(0xffec2F4B)
    ),
  ),
  ColorModel(
      svgPath: "assets/svg/Cloudy_dark.svg",
      color: const Color(0xff2ebf91),
      gradient: const LinearGradient(
        colors: [Color(0xff8360c3), Color(0xff2ebf91)],
        stops: [0, 1],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      )),
  ColorModel(
    svgPath: "assets/svg/Cloudy_dark.svg",
    color: const Color(0xff123cd1),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(-0.31, 0.95),
      colors: [Color(0xFF1042F4), Colors.black45],
    ),
  ),
  ColorModel(
    svgPath: "assets/svg/Cloudy_dark.svg",
    color: Colors.purple,
    gradient: const LinearGradient(
      colors: [Color(0xffc95edb), Colors.black12],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  ColorModel(
    svgPath: "assets/svg/Cloudy_dark.svg",
    color: const Color(0xfff35a32),
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Colors.indigo, Color(0xFFF46235)],
    ),
  ),
];
