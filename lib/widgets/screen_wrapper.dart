import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/model/color_model.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:portfolio/views/mobile_screen.dart';
import 'package:portfolio/views/tab_screen.dart';
import 'package:provider/provider.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({super.key, required this.child, this.title});
  final Widget child;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(builder: (context, state, _) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!state.isMainScreen)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                gradient: colorPalette[state.colorIndex].gradient,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      state.title.toUpperCase(),
                      style: GoogleFonts.dmSans(
                        fontSize: state.isTabScreen ? 32 : 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.4,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          state.setCurrentScreen(
                              state.isTabScreen
                                  ? const TabScreen()
                                  : const MobileScreen(),
                              true);
                        },
                        icon: Icon(
                          Icons.close,
                          size: state.isTabScreen ? 36 : 28,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
          Expanded(child: child)
        ],
      );
    });
  }
}
