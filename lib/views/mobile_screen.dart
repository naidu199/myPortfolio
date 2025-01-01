import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:provider/provider.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(
      builder: (context, state, _) {
        return Container(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          // decoration: BoxDecoration(
          //   gradient: colorPalette[state.colorIndex].gradient,
          // ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.spaceEvenly,
            children: [
              ...List.generate(
                appModels.length,
                (index) => Container(
                  margin: const EdgeInsets.only(
                    right: 10,
                    top: 10,
                    bottom: 20,
                    left: 10,
                  ),
                  child: Column(
                    children: [
                      CustomButton(
                        margin: const EdgeInsets.only(bottom: 5),
                        borderRadius:
                            state.deviceInfo == Devices.ios.iPhone13ProMax
                                ? 8
                                : 100,
                        onPressed: () async {
                          if (appModels[index].link != null) {
                            await state.launchAppUrl(appModels[index].link!);
                          } else {
                            if (appModels[index].widget != null) {
                              state.setCurrentScreen(
                                  appModels[index].widget!, false);
                              state.title = appModels[index].appName;
                            }
                          }
                        },
                        width: 64,
                        height: 64,
                        // backgroundColor: appModels[index].color,
                        backgroundColor: Colors.white.withOpacity(0.9),
                        child: appModels[index].assetPath != null
                            ? Image.asset(
                                fit: BoxFit.cover,
                                appModels[index].assetPath!,
                                width: 60,
                                height: 60,
                              )
                            : Center(
                                child: Icon(
                                  appModels[index].iconData,
                                  size: 36,
                                  color: Colors.black,
                                ),
                              ),
                      ),
                      SizedBox(
                        width: 86,
                        child: Center(
                          child: Text(
                            appModels[index].appName,
                            // overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
