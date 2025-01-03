import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/model/work_experience.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:provider/provider.dart';

class WorkExperienceFull extends StatelessWidget {
  final List<WorkExperience> experiences;

  const WorkExperienceFull({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(builder: (context, state, _) {
      double cardWidth = state.isTabScreen ? 480 : 340;

      return Container(
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: [
            //     Color(0xFFF8F9FA),
            //     Color(0xFFE8EAF6),
            //   ],
            // ),
            ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(left: 12, bottom: 32),
              //   child: Text(
              //     "Work Experience",
              //     style: GoogleFonts.plusJakartaSans(
              //       fontSize: 32,
              //       fontWeight: FontWeight.w800,
              //       background: Paint()
              //         ..strokeWidth = 12
              //         ..color = const Color(0xFF2563EB).withOpacity(0.1)
              //         ..style = PaintingStyle.stroke,
              //       color: const Color(0xFF1A1A1A),
              //     ),
              //   ),
              // ),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: experiences.map((experience) {
                  return _buildExperienceCard(experience, cardWidth, state);
                }).toList(),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildExperienceCard(
      WorkExperience experience, double cardWidth, ScreenState state) {
    return MouseRegion(
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 200),
        tween: Tween<double>(begin: 1, end: 1),
        builder: (context, double value, child) {
          return Transform.scale(
            scale: value,
            child: Container(
              width: cardWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 24,
                    color: Colors.black.withOpacity(0.06),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo Container with Gradient Background
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFF2563EB).withOpacity(0.05),
                          const Color(0xFF2563EB).withOpacity(0.1),
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Background Pattern
                        Positioned.fill(
                          child: CustomPaint(
                            painter: GridPainter(),
                          ),
                        ),
                        // Logo
                        Center(
                          child: Container(
                            width: state.isTabScreen ? 98 : 86,
                            height: state.isTabScreen ? 98 : 86,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 12,
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                experience.logoPath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Content Section
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                experience.company,
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: state.isTabScreen ? 32 : 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.5,
                                  color: const Color(0xFF1A1A1A),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF2563EB),
                                Color(0xFF3B82F6),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 2),
                                blurRadius: 8,
                                color: const Color(0xFF2563EB).withOpacity(0.2),
                              ),
                            ],
                          ),
                          child: Text(
                            experience.role,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: state.isTabScreen ? 18 : 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          experience.description,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: state.isTabScreen ? 20 : 18,
                            height: 1.6,
                            color: const Color(0xFF4B5563),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.timeline_outlined,
                                size: state.isTabScreen ? 24 : 20,
                                color: const Color(0xFF6B7280),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                experience.duration,
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: state.isTabScreen ? 20 : 16,
                                  color: const Color(0xFF6B7280),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Custom painter for background grid pattern
class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..strokeWidth = 1;

    const spacing = 20.0;

    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, size.height),
        paint,
      );
    }

    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width, i),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
