class Project {
  final String title; // Project title
  final String description; // Brief description of the project
  final String imagePath; // Path to the project's preview image
  final List<String> technologies; // List of technologies used
  final String? githubLink; // Optional GitHub link
  final String? liveDemoLink; // Optional live demo link
  final String category; // e.g., Mobile, Web, Full-Stack

  Project({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.technologies,
    this.githubLink,
    this.liveDemoLink,
    required this.category,
  });
}

List<Project> projects = [
  Project(
    title: "SeaAegis",
    description:
        "A beach safety app providing real-time alerts and hazard information.",
    imagePath: "assets/images/seaaegis.png",
    technologies: ["Flutter", "Machine Learning", "Firebase", "REST API"],
    githubLink: "https://github.com/naidu/seaaegis",
    liveDemoLink: "https://seaaegis.app",
    category: "Mobile",
  ),
  Project(
    title: "Nexus Sparks Platform",
    description:
        "A collaborative platform connecting users with service professionals.",
    imagePath: "assets/images/nexus_sparks.png",
    technologies: ["React", "Node.js", "Express.js", "Firebase"],
    githubLink: "https://github.com/naidu/nexus-sparks",
    liveDemoLink: null, // No live demo available
    category: "Web",
  ),
];
