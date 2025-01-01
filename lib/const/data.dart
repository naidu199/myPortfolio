import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/model/app_model.dart';
import 'package:portfolio/model/device_model.dart';
import 'package:portfolio/model/project_details.dart';
import 'package:portfolio/model/work_experience.dart';
import 'package:portfolio/views/app_views/about.dart';
import 'package:portfolio/views/app_views/contact_us.dart';
import 'package:portfolio/views/app_views/experience_full.dart';
import 'package:portfolio/views/app_views/projects.dart';
import 'package:portfolio/views/app_views/skills.dart';

List<DeviceModel> devices = [
  DeviceModel(
    device: Devices.android.samsungGalaxyNote20,
    icon: Icons.android,
  ),
  DeviceModel(
    device: Devices.ios.iPhone13ProMax,
    icon: Icons.apple_rounded,
  ),
  DeviceModel(
    device: Devices.ios.iPad,
    icon: Icons.tablet_mac_outlined,
  ),
  // DeviceModel(
  //   device: Devices.windows.laptop,
  //   icon: Icons.desktop_mac_rounded,
  // ),
];

List<AppModel> appModels = [
  AppModel(
      appName: 'About',
      color: Colors.white,
      iconData: Icons.person,
      assetPath: "assets/icons/about me.png",
      widget: const AboutScreen()),
  AppModel(
      appName: 'Experience',
      color: Colors.white,
      iconData: Icons.person,
      assetPath: "assets/icons/experience.png",
      widget: WorkExperienceFull(
        experiences: workExperiences,
      )),
  AppModel(
    appName: 'Projects',
    color: Colors.white,
    iconData: Icons.person,
    assetPath: "assets/icons/project.png",
    widget: Projects(
      projectCards: projectCards,
    ),
  ),
  AppModel(
    appName: 'Resume',
    color: Colors.white,
    iconData: Icons.person,
    link: resume,
    assetPath: "assets/icons/resume.png",
  ),
  AppModel(
      appName: 'Skills',
      color: Colors.white,
      iconData: Icons.person,
      assetPath: "assets/icons/skills.png",
      widget: const SkillsScreen()),
  AppModel(
    appName: 'Contact',
    color: Colors.white,
    iconData: Icons.person,
    assetPath: "assets/icons/email.png",
    widget: const CollaborationFormScreen(),
  ),
  AppModel(
    appName: 'LinkedIn',
    color: Colors.white,
    iconData: Icons.person,
    link: linkedIn,
    assetPath: "assets/icons/linkedin.png",
  ),
  AppModel(
    appName: 'GitHub',
    color: Colors.white,
    iconData: Icons.person,
    link: github,
    assetPath: "assets/icons/github.png",
  ),
  AppModel(
    appName: 'LeetCode',
    color: Colors.white,
    iconData: Icons.person,
    link: leetCode,
    assetPath: "assets/icons/leetcode.png",
  ),
  AppModel(
      appName: 'GFG',
      color: Colors.white,
      iconData: Icons.person,
      link: gfg,
      assetPath: "assets/icons/gfg.png"),
  AppModel(
      appName: 'Medium',
      color: Colors.white,
      iconData: Icons.person,
      link: medium,
      assetPath: "assets/icons/medium.png"),
  AppModel(
    appName: 'Info',
    color: Colors.white,
    iconData: Icons.person,
    assetPath: "assets/icons/info.png",
  ),
];

String linkedIn = "https://www.linkedin.com/in/narasimhanaidukorrapati/";
String github = "https://github.com/naidu199";
String leetCode = "https://leetcode.com/naidu199/";
String gfg = "https://www.geeksforgeeks.org/user/narasimhankbj3/";
String medium = "https://medium.com/@naidu199";
String email = "narasimhanaidu1909@gmail.com";
String phone = "+918125150264";
String introduction =
    "I am a passionate Flutter Developer, Competitive Programmer, Blogger, and Open Source Contributor. I am currently pursuing my B.Tech in Computer Science and Engineering from Vishnu Institute of Technology, Bhimavaram, Andhra Pradesh, India.";
String noofProjects = "10+";

String address =
    "Vishnu Institute of Technology, Bhimavaram, Andhra Pradesh, India";
String aboutMe =
    "Flutter Developer, Competitive Programmer, Blogger, and Open Source Contributor";
String resume =
    "https://drive.google.com/file/d/1_S7kUj2zvHM97HkiEjgTtFi63ZTBalLf/view?usp=sharing";
String name = "K Thirumala Narasimha Naidu";
String profession = "Flutter Developer";
String profile1 = "assets/image/profile1.png";
String profile2 = "assets/image/profile2.png";
String profile3 = "assets/image/profile3.png";
String profileNobg = "assets/image/profile_nobg.png";

String fullName = "Hey, I'm Korrapati Thirumala Narasimha Naidu!";
String about = """
Welcome to my portfolio website, I'm a B.Tech Computer Science student at Vishnu Institute of Technology with a deep interest in Application Development, Artificial Intelligence and Machine Learning.....

I specialize in Flutter development, full-stack solutions, and machine learning applications. My work includes building real-time data platforms, crop yield prediction tools, and AI-driven mobile solutions. I'm passionate about creating user-centric, scalable applications that integrate seamlessly with modern APIs, AI&ML and Databases.

Always eager to explore emerging technologies, I’m driven to transform ideas into meaningful solutions that make a difference.

Let’s create something extraordinary together!
""";
