import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/model/skill_model.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:provider/provider.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatingAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _floatingAnimation = Tween<double>(begin: -10.0, end: 10.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(builder: (context, state, _) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10.0,
            runSpacing: 10.0,
            children: List.generate(skills.length, (index) {
              final skill = skills[index];
              return GestureDetector(
                onTap: () {
                  state.launchAppUrl(skill.link);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBuilder(
                      animation: _floatingAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, _floatingAnimation.value),
                          child: child,
                        );
                      },
                      child: Image.network(
                        skill.image,
                        height: 260,
                        width: 260,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      skill.name,
                      style: GoogleFonts.pompiere(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}
