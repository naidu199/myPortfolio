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
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with overlay
              Stack(
                children: [
                  Image.asset(
                    project.imagePath,
                    height: state.isTabScreen ? 250 : 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Category tag
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        project.category,
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[700],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: GoogleFonts.dmSans(
                        fontSize: state.isTabScreen ? 24 : 20,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      project.description,
                      // maxLines: 4,
                      // overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.dmSans(
                        fontSize: state.isTabScreen ? 18 : 16,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Technologies
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.technologies
                          .map((tech) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.blue[100]!),
                                ),
                                child: Text(
                                  tech,
                                  style: GoogleFonts.dmSans(
                                    fontSize: 12,
                                    color: Colors.blue[700],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),

                    const SizedBox(height: 20),

                    // Buttons
                    Row(
                      children: [
                        if (project.githubLink != null)
                          Expanded(
                            child: FilledButton.icon(
                              onPressed: () =>
                                  state.launchAppUrl(project.githubLink!),
                              icon: const Icon(Icons.code, size: 18),
                              label: const Text('GitHub'),
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.all(16),
                                backgroundColor: Colors.grey[900],
                              ),
                            ),
                          ),
                        if (project.githubLink != null &&
                            project.liveDemoLink != null)
                          const SizedBox(width: 12),
                        if (project.liveDemoLink != null)
                          Expanded(
                            child: FilledButton.icon(
                              onPressed: () =>
                                  state.launchAppUrl(project.liveDemoLink!),
                              icon: const Icon(Icons.rocket_launch_rounded,
                                  size: 18),
                              label: const Text('Live Demo'),
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.all(16),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
