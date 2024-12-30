import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(builder: (context, state, _) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: state.isTabScreen ? 100 : 80,
                backgroundImage: const AssetImage("assets/image/profile3.png"),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                textAlign: TextAlign.center,
                fullName,
                style: GoogleFonts.quintessential(
                  fontSize: state.isTabScreen ? 40 : 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(24),
                child: Text(
                  textAlign: TextAlign.start,
                  about,
                  style: GoogleFonts.lugrasimo(
                    fontSize: state.isTabScreen ? 32 : 24,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
