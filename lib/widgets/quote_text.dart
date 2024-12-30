import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteText extends StatelessWidget {
  const QuoteText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4)
          .copyWith(top: 6),
      child: ShaderMask(
        shaderCallback: (bounds) {
          // Ensure the gradient covers the bounds of the text
          return const LinearGradient(
            colors: [
              // Colors.purpleAccent,
              Color(0xFF312B2B),
              Color(0xFFCC342C),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds);
        },
        child: Text(
          "Coding is my Canvas, and Flutter is my Brush",
          textAlign: TextAlign.center,
          style: GoogleFonts.protestRevolution(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
