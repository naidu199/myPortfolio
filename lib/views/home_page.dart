import 'dart:async';

import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/model/color_model.dart';
import 'package:portfolio/model/project_details.dart';
import 'package:portfolio/model/work_experience.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:portfolio/views/app_views/contact_us.dart';
import 'package:portfolio/widgets/glass_container.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:portfolio/widgets/quote_text.dart';
import 'package:portfolio/widgets/screen_wrapper.dart';
import 'package:provider/provider.dart';

import 'app_views/experience.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ScreenState>(builder: (context, state, _) {
      return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: colorPalette[state.colorIndex].gradient,
              ),
            ),
            // SvgPicture.asset(
            //   colorPalette[state.colorIndex].svgPath,
            //   fit: BoxFit.cover,
            //   height: size.height,
            // ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.height - 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Left Column (Two Glass Widgets)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Top Left Glass Widget
                          TransformedGlassWidget(
                            width: 240,
                            height: 320,
                            alignment: Alignment.bottomCenter,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.01)
                              ..rotateY(-0.06),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 20)
                                  .copyWith(bottom: 4),
                              child: WorkExperienceTimeline(
                                experiences: workExperiences,
                              ),
                            ),

                            // transform: Matrix4.identity()
                            // ..setEntry(3, 2, 0.01)
                            //       ..rotateY(-0.06),
                            //  alignment: FractionalOffset.center,
                          ),
                          const SizedBox(height: 10),
                          // Bottom Left Glass Widget
                          TransformedGlassWidget(
                            width: 240,
                            height: 160,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.00999)
                              ..rotateY(-0.07),
                            alignment: Alignment.topCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Get in Touch',
                                  style: GoogleFonts.eagleLake(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomButton(
                                  animate: true,
                                  borderRadius: 20,
                                  shadowColor: Colors.blueGrey[50],
                                  isThreeD: true,
                                  // pressed: index == state.colorIndex
                                  //     ? Pressed.pressed
                                  //     : Pressed.notPressed,
                                  backgroundColor: Colors.deepPurpleAccent,
                                  width: 172,
                                  height: 40,
                                  onPressed: () {
                                    state.setCurrentScreen(
                                        const CollaborationFormScreen(), false);
                                    state.title = "Let's Connect!";
                                  },
                                  child: Text(
                                    "Let's Collaborate!",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.w600,
                                      // letterSpacing: 1.2,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                // const EmailButton(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 40)
                                      .copyWith(bottom: 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          state.launchAppUrl(linkedIn);
                                        },
                                        child: Image.asset(
                                          "assets/icons/linkedin.png",
                                          height: 36,
                                          width: 36,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          state.launchAppUrl(github);
                                        },
                                        child: Image.asset(
                                          "assets/icons/github.png",
                                          height: 36,
                                          width: 36,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          state.launchEmail();
                                        },
                                        child: Image.asset(
                                          "assets/icons/email.png",
                                          height: 32,
                                          width: 32,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),
                      // Device Frame
                      DeviceFrame(
                        device: state.deviceInfo,
                        isFrameVisible: true,
                        orientation: Orientation.portrait,
                        screen: Container(
                          decoration: BoxDecoration(
                            gradient: colorPalette[state.colorIndex].gradient,
                          ),
                          child: ScreenWrapper(
                            title: '',
                            child: state.currentScreen,
                          ),
                          // child: ProjectCard(
                          //   project: projects[0],
                          // ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      // Right Column (Two Glass Widgets)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Top Right Glass Widget
                          TransformedGlassWidget(
                            width: 240,
                            height: 320,
                            alignment: Alignment.bottomCenter,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.01)
                              ..rotateY(0.06), // Slight outward rotation
                            child: Column(
                              children: [
                                // CircleAvatar(
                                //   radius: 56,
                                //   backgroundImage: AssetImage(profile3),
                                // ),
                                Image.asset(
                                  profileNobg,
                                  height: 132,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  fullName,
                                  style: GoogleFonts.quintessential(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextAnimator(
                                  screenState: state,
                                ),

                                const QuoteText()
                                // Text(
                                //   "Coding is my Canvas, and Flutter is my Brush",
                                //   textAlign: TextAlign.center,
                                //   style: GoogleFonts.protestRevolution(
                                //       fontSize: 18,
                                //       fontWeight: FontWeight.bold,
                                //       color: Colors.deepOrangeAccent),
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Bottom Right Glass Widget
                          TransformedGlassWidget(
                            width: 240,
                            height: 160,
                            alignment: Alignment.topCenter,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.00999)
                              ..rotateY(0.08),
                            child: Center(
                              child: Wrap(
                                children: [
                                  ...List.generate(
                                    colorPalette.length,
                                    (index) => Container(
                                      width: 52.5,
                                      height: 52.5,
                                      margin: const EdgeInsets.all(10),
                                      child: CustomButton(
                                        animate: true,
                                        borderRadius: 100,
                                        shadowColor: Colors.blueGrey[50],
                                        isThreeD: true,
                                        pressed: index == state.colorIndex
                                            ? Pressed.pressed
                                            : Pressed.notPressed,
                                        backgroundColor:
                                            colorPalette[index].color,
                                        width: 50,
                                        height: 50,
                                        onPressed: () {
                                          state.changeColorPallet(index);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // Device Selection Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      devices.length,
                      (index) => CustomButton(
                        backgroundColor: Colors.blueAccent.shade200,
                        shadowColor: Colors.white.withOpacity(0.6),
                        onPressed: () => state.changeScreen(index),
                        height: 40,
                        width: 40,
                        borderRadius: 100,
                        isThreeD: true,
                        animate: true,
                        pressed: state.deviceInfo == devices[index].device
                            ? Pressed.pressed
                            : Pressed.notPressed,
                        child: Center(
                          child: Icon(
                            devices[index].icon,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class TextAnimator extends StatefulWidget {
  const TextAnimator({super.key, required this.screenState});
  final ScreenState screenState;
  @override
  State<TextAnimator> createState() => _TextAnimatorState();
}

class _TextAnimatorState extends State<TextAnimator> {
  final List<String> titles = [
    'Flutter Developer',
    'Web Developer',
    'Android Developer',
    'AI&ML Enthusiast',
    'Researcher',
    'Full-Stack Developer'
  ];
  String displayedText = '';
  int currentIndex = 0;
  bool isTyping = true;

  @override
  void initState() {
    super.initState();
    startTypingAnimation();
  }

  void startTypingAnimation() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (isTyping) {
        if (displayedText.length < titles[currentIndex].length) {
          setState(() {
            displayedText += titles[currentIndex][displayedText.length];
          });
        } else {
          isTyping = false;
          Timer(const Duration(seconds: 2), () {
            setState(() {
              displayedText = '';
              isTyping = true;
              currentIndex = (currentIndex + 1) % titles.length;
            });
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => colorPalette[widget.screenState.colorIndex]
          .gradient
          .createShader(bounds),
      child: Text(
        "I'm a $displayedText",
        style: GoogleFonts.quintessential(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurpleAccent.shade400,
        ),
        // style: const TextStyle(),
      ),
    );
  }
}
