class Project {
  final String title;
  final String description;
  final String imagePath;
  final List<String> technologies;
  final String? githubLink;
  final String? liveDemoLink;
  final String category;

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
        "A beach safety app providing real-time alerts, hazard information and AI-driven predictions for enhanced user experience and safety",
    imagePath: "assets/projects/sea.png",
    technologies: [
      "Flutter",
      "Machine Learning",
      "Firebase",
      "REST API's",
      "Cloud Messaging",
    ],
    githubLink: "https://github.com/SeaAegis",
    liveDemoLink:
        "https://www.linkedin.com/posts/narasimhanaidukorrapati_sih2024-hackathon-beachsafety-activity-7243572668996747264-Oq91?utm_source=share&utm_medium=member_desktop",
    category: "Mobile",
  ),
  Project(
    title: "Agro-Genesis",
    description:
        "A mobile application bridging the gap between farmers and technology by providing real-time insights and AI-driven predictions",
    imagePath: "assets/images/agro_genesis.png",
    technologies: [
      "Flutter",
      "Machine Learning",
      "Firestore",
      "Flask",
    ],
    githubLink: "https://github.com/AgroGenesis",
    liveDemoLink: "https://youtu.be/8PzG5_L_TX0?si=I3JJIe50wkx5Vydz",
    category: "Mobile",
  ),
  Project(
    title: "HelperHive",
    description:
        "A Home Service provider app that connects users with a variety of service professionals and enabling direct one-to-one communication.",
    imagePath: "assets/projects/helperhive_ui.png",
    technologies: [
      "Flutter",
      "Firebase",
      "Cloud Storage",
      "Firestore",
    ],
    githubLink: "https://github.com/helperhive",
    liveDemoLink:
        "https://www.linkedin.com/posts/narasimhanaidukorrapati_flutter-firebase-dart-activity-7221224222801502209-HskL?utm_source=share&utm_medium=member_desktop",
    category: "Mobile",
  ),
  Project(
    title: "BrillsChain ",
    description:
        "a cross-platform app to minimize supply chain wastage using AI algorithms and smart contracts for seamless goods transfers.",
    imagePath: "assets/projects/supply_chain.png",
    technologies: [
      "Flutter",
      "Machine Learning",
      "AI",
      "BlockChain",
      "Firestore",
      "Flask",
    ],
    githubLink: "https://github.com/AgroGenesis",
    liveDemoLink: null,
    category: "Cross Platform",
  ),
  Project(
    title: "Instagram clone",
    description:
        "A feature-rich social media app replicating the core functionalities of Instagram, built with modern technologies.",
    imagePath: "assets/projects/insta_web.png",
    technologies: ["Flutter", "Firebase", "Cloud Storage", "Firestore"],
    githubLink: "https://github.com/helperhive",
    liveDemoLink:
        "https://www.linkedin.com/posts/narasimhanaidukorrapati_flutter-firebase-dart-activity-7199726695271026688-Dv-T?utm_source=share&utm_medium=member_desktop",
    category: "Mobile",
  ),
  Project(
    title: "One-to-One Chat Application",
    description:
        "A real-time chat application allowing users to communicate one-on-one, featuring direct messaging, notifications, and a user-friendly interface.",
    imagePath: "assets/projects/one_to_one_chat.png",
    technologies: [
      "Flutter",
      "Firestore",
      "Cloud Messaging",
    ],
    githubLink: "https://github.com/naidu199/chat_application_flutter",
    liveDemoLink:
        "https://www.linkedin.com/posts/narasimhanaidukorrapati_flutter-firebase-dart-activity-7203123768494362624-ohTX?utm_source=share&utm_medium=member_desktop",
    category: "Cross Platform",
  ),
  Project(
    title: "E-Learning Application",
    description:
        "A web application designed to enhance rural literacy through engaging and effective remote learning experiences, built using HTML, CSS, and JavaScript.",
    imagePath: "assets/images/rural_literacy_app.png",
    technologies: ["HTML", "CSS", "JavaScript"],
    githubLink: "https://github.com/naidu199/E-Learning-Application",
    liveDemoLink:
        "https://www.linkedin.com/posts/maddula-pavan_ruraleducation-teamproject-educationforall-ugcPost-7145708044759228417-fWe7?utm_source=share&utm_medium=member_desktop", // Replace with actual demo link
    category: "Web",
  ),
  Project(
    title: "Live Streaming App",
    description:
        "A live streaming app that allows for smooth, high-quality video streaming. It offers a seamless user experience with the ability to stream live content, leveraging Flutter's cross-platform capabilities.",
    imagePath: "assets/images/live_streaming_app.png",
    technologies: ["Flutter", "VideoSDK", "flutter_vlc_player"],
    githubLink: "assets/projects/live_streaming.png",
    liveDemoLink:
        "https://www.linkedin.com/posts/narasimhanaidukorrapati_flutter-livestreaming-videosdk-activity-7241720517336915970-7RVE?utm_source=share&utm_medium=member_desktop",
    category: "Mobile",
  ),
  Project(
    title: "Genie AI",
    description:
        "A Gemini clone app that provides a seamless experience for users to explore content through the Gemini protocol on both mobile devices and web browsers.",
    imagePath: "assets/projects/genie_web.png",
    technologies: ["Flutter", "Gemini API"],
    githubLink: "https://github.com/naidu199/gemini-clone",
    liveDemoLink:
        "https://www.linkedin.com/posts/narasimhanaidukorrapati_flutter-flutterdeveloper-androidappdevelopment-activity-7172619785111810048-aFME?utm_source=share&utm_medium=member_desktop",
    category: "Mobile & Web",
  ),
];
