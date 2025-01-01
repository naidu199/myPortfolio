import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/model/project_details.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:provider/provider.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(builder: (context, state, _) {
      return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(0),
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    fit: BoxFit.fill,
                    project.imagePath,
                    // "assets/projects/sea1.png",
                    height: 250,
                    width: 400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Text(
                        "${project.title} (${project.category})",
                        style: GoogleFonts.dmSans(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        project.description,
                        style: GoogleFonts.dmSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Wrap(
                  spacing: 16,
                  // runSpacing: 16,
                  children: [
                    ...List.generate(
                      project.technologies.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(1, 2),
                              color: Colors.blue.withOpacity(0.5),
                            ),
                          ],
                        ),
                        child: Text(
                          project.technologies[index],
                          style: GoogleFonts.dmSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (project.githubLink != null)
                        ElevatedButton.icon(
                          onPressed: () {
                            // Open GitHub Link
                            if (project.githubLink != null) {
                              // launchUrl(Uri.parse(project. githubLink!));
                              state.launchAppUrl(project.githubLink!);
                            }
                          },
                          icon: const Icon(
                            Icons.code,
                            size: 24,
                          ),
                          label: const Text(
                            "GitHub",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      if (project.liveDemoLink != null)
                        ElevatedButton.icon(
                          onPressed: () {
                            // Open Live Demo Link
                            if (project.liveDemoLink != null) {
                              state.launchAppUrl(project.liveDemoLink!);
                              // launchUrl(Uri.parse(project.liveDemoLink!));
                            }
                          },
                          icon: const Icon(
                            Icons.open_in_browser,
                            size: 24,
                          ),
                          label: const Text(
                            "Live Demo",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
