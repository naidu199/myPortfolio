import 'package:flutter/material.dart';

import 'package:portfolio/providers/screen_state.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class RiveBirdAnimation extends StatelessWidget {
  const RiveBirdAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(builder: (context, state, _) {
      return GestureDetector(
        onTap: () {
          state.toggleDance();
        },
        child: SizedBox(
          // color: Colors.red,
          height: 250,
          width: 275,
          child: state.artboard != null
              ? Rive(artboard: state.artboard!)
              : const SizedBox(),
        ),
      );
    });
  }
}
