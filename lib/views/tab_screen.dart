import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(
      builder: (context, state, _) {
        return Container(
          padding: const EdgeInsets.only(top: 75, left: 50, right: 50),
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
                    right: 15,
                    top: 15,
                    bottom: 25,
                    left: 15,
                  ),
                  child: Column(
                    children: [
                      CustomButton(
                        margin: const EdgeInsets.only(bottom: 5),
                        borderRadius: 20,
                        onPressed: () async {
                          if (appModels[index].link != null) {
                            await state.launchAppUrl(appModels[index].link!);
                          } else {
                            if (appModels[index].widget != null) {
                              state.setCurrentScreen(
                                  appModels[index].widget!, false);
                            }
                          }
                        },
                        width: 96,
                        height: 96,
                        backgroundColor: appModels[index].color,
                        child: Center(
                          child: Icon(
                            appModels[index].iconData,
                            size: 48,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: Center(
                          child: Text(
                            appModels[index].appName,
                            // overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.openSans(
                              fontSize: 18,
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