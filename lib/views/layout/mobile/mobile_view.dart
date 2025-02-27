import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/const/data.dart';

import 'package:portfolio/model/color_model.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:portfolio/widgets/screen_wrapper.dart';
import 'package:provider/provider.dart';

class MobileView extends StatelessWidget {
  const MobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(
      builder: (context, state, _) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: colorPalette[state.colorIndex].gradient,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: DeviceFrame(
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
                ),
                // Center(
                //   child: Wrap(
                //     children: [
                //       ...List.generate(
                //         colorPalette.length,
                //         (index) => Container(
                //           width: 46.5,
                //           height: 46.5,
                //           margin: const EdgeInsets.all(5),
                //           child: CustomButton(
                //             animate: true,
                //             borderRadius: 100,
                //             shadowColor: Colors.blueGrey[50],
                //             isThreeD: true,
                //             pressed: index == state.colorIndex
                //                 ? Pressed.pressed
                //                 : Pressed.notPressed,
                //             backgroundColor: colorPalette[index].color,
                //             width: 42,
                //             height: 42,
                //             onPressed: () {
                //               state.changeColorPallet(index);
                //               // state.toggleLookUp();
                //             },
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 10,
                //       )
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      devices.length - 1,
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
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
