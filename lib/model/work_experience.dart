class WorkExperience {
  final String company;
  final String role;
  final String description;
  final String duration;
  final String logoPath;
  WorkExperience({
    required this.company,
    required this.role,
    required this.description,
    required this.duration,
    required this.logoPath,
  });
}

final List<WorkExperience> workExperiences = [
  WorkExperience(
    logoPath: 'assets/logos/chauwk.jpg',
    company: 'Chauwk',
    role: 'Full-stack Developer Intern',
    description:
        'Developing and maintaining mobile applications with scalable features, integrating APIs, and optimizing UI/UX for gig economy and skill development platforms',
    duration: 'Oct 2024 - Present',
  ),
  WorkExperience(
    logoPath: "assets/logos/ohsm.jpg",
    company: 'OHSM',
    role: 'Flutter Developer Intern',
    description:
        "App to streamline vacation rental property management, including housekeeping, maintenance, and staff modules. Collaborated on integrating REST APIs and optimizing app performance for seamless user experience and system reliability",
    duration: 'Jun 2024 - Sep 2024',
  ),
  WorkExperience(
    logoPath: "assets/logos/nexus_spark.jpg",
    company: 'Nexus Sparks',
    role: 'Co-Founder',
    description:
        'At Nexus Sparks we believe in Transform Ideas into Projects. We innovate, and empower our community by offering courses that shape the future.',
    duration: 'Aug 2024 - Present',
  ),
  WorkExperience(
    logoPath: "assets/logos/google.jpg",
    company: 'Google',
    role: 'Android Developer Virtual Internship ',
    description:
        "Learned Kotlin and Android development using Android Studio. Developed user interfaces, handled user inputs. Implemented best practices in coding and debugging. Completed some small Android projects",
    duration: 'Apr 2024 - Jun 2024',
  ),
  WorkExperience(
    logoPath: "assets/logos/aws.jpg",
    company: 'AWS',
    role: "AI & ML Virtual internship",
    description:
        'Actively engaged with various online resources, hands-on labs, tutorials, and instructional videos to enhance proficiency in AI & ML concepts and skills.',
    duration: 'Jan 2024 - Mar 2024',
  ),
];
