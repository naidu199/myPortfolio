import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/model/work_experience.dart';
import 'package:timeline_tile/timeline_tile.dart';

class WorkExperienceTimeline extends StatelessWidget {
  final List<WorkExperience> experiences;

  const WorkExperienceTimeline({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Experience",
          style: GoogleFonts.eagleLake(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        Expanded(
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
                  width: 36,
                  height: 36,
                  indicator: CircleAvatar(
                    radius: 64,
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
                  color: Colors.white70,
                  thickness: 2,
                ),
                afterLineStyle: const LineStyle(
                  color: Colors.white70,
                  thickness: 2,
                ),
                endChild: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        experience.company,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        experience.role,
                        softWrap: true,
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF20342D),
                        ),
                      ),
                      // const SizedBox(height: 8),
                      // Text(experience.description),
                      const SizedBox(height: 8),
                      Text(
                        experience.duration,
                        style: GoogleFonts.dmSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
