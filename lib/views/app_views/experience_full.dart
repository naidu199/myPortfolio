import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/model/work_experience.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

class WorkExperienceFull extends StatelessWidget {
  final List<WorkExperience> experiences;

  const WorkExperienceFull({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(builder: (context, state, _) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: experiences.length,
          itemBuilder: (context, index) {
            final experience = experiences[index];
            return TimelineTile(
              alignment: TimelineAlign.start,
              isFirst: index == 0,
              isLast: index == experiences.length - 1,
              indicatorStyle: IndicatorStyle(
                width: state.isTabScreen ? 76 : 64,
                height: state.isTabScreen ? 76 : 64,
                indicator: CircleAvatar(
                  // radius: 64,
                  backgroundImage: AssetImage(experience.logoPath),
                ),
                // width: 64,
                // color: index % 2 == 0 ? Colors.blue : Colors.orange,
                // iconStyle: IconStyle(
                //   iconData: Icons.work,
                //   // iconData: index == 0
                //   //     ? Icons.check
                //   //     : index == 1
                //   //         ? Icons.loop
                //   //         : Icons.work,
                //   color: Colors.white,

                // ),
              ),
              beforeLineStyle: const LineStyle(
                color: Colors.white,
                thickness: 4,
              ),
              afterLineStyle: const LineStyle(
                color: Colors.white,
                thickness: 4,
              ),
              endChild: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.9),
                        Colors.white.withOpacity(0.7),
                      ],
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.1),
                        blurRadius: 4,
                        spreadRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          experience.company,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: state.isTabScreen ? 34 : 28,
                            color: const Color(0xFF9F0BDE),
                          ),
                        ),
                        Text(
                          experience.role,
                          softWrap: true,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.italic,
                            fontSize: state.isTabScreen ? 24 : 20,
                            color: const Color(0xFF26342F),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          experience.description,
                          style: GoogleFonts.dmSans(
                            fontSize: state.isTabScreen ? 20 : 18,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff123524),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          experience.duration,
                          style: GoogleFonts.dmSans(
                            fontSize: state.isTabScreen ? 18 : 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF7706A7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
