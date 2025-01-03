import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeInAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.7, curve: Curves.easeIn),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(builder: (context, state, _) {
      final isTab = state.isTabScreen;
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: isTab ? 24 : 16,
            horizontal: isTab ? 32 : 20,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.indigo.withOpacity(0.3),
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              // Animated Profile Section
              ScaleTransition(
                scale: _scaleAnimation,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: isTab ? 250 : 210,
                      height: isTab ? 250 : 210,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.withOpacity(0.2),
                            Colors.purple.withOpacity(0.2),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 25,
                            spreadRadius: 5,
                          ),
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.3),
                            blurRadius: 25,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: isTab ? 120 : 100,
                        backgroundColor: Colors.white.withOpacity(0.1),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            radius: isTab ? 116 : 96,
                            backgroundImage:
                                const AssetImage("assets/image/profile3.png"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Animated Name with New Typography
              SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeInAnimation,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        textAlign: TextAlign.center,
                        fullName,
                        textStyle: GoogleFonts.playfairDisplay(
                          fontSize: isTab ? 52 : 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.blue.withOpacity(0.5),
                              blurRadius: 15,
                            ),
                          ],
                          letterSpacing: 1.2,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
                ),
              ),
              // Enhanced About Text Container
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                padding: EdgeInsets.all(isTab ? 40 : 32),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.05),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.05),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeInAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About Me",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: isTab ? 36 : 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.95),
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          about,
                          style: GoogleFonts.sourceSerif4(
                            fontSize: isTab ? 28 : 24,
                            height: 1.8,
                            color: Colors.white.withOpacity(0.85),
                            letterSpacing: 0.5,
                            wordSpacing: 1.2,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
