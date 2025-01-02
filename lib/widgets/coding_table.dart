import 'package:flutter/material.dart';

import 'package:portfolio/providers/screen_state.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class CodingTableAnimation extends StatefulWidget {
  const CodingTableAnimation({super.key});

  @override
  State<CodingTableAnimation> createState() => _CodingTableAnimationState();
}

class _CodingTableAnimationState extends State<CodingTableAnimation> {
  Artboard? artboardCodingTable;

  StateMachineController? controllerCodingTable;
  final String asset2 = "assets/animations/rive/flutter_developer.riv";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerCodingTableInit();
  }

  Future<void> controllerCodingTableInit() async {
    try {
      final riveFile = await RiveFile.asset(asset2);

      final artboardCodingTable = riveFile.mainArtboard;
      controllerCodingTable = StateMachineController.fromArtboard(
          artboardCodingTable, "flutter_developer");
      if (controllerCodingTable != null) {
        artboardCodingTable.addController(controllerCodingTable!);
      }
      this.artboardCodingTable = artboardCodingTable;
      setState(() {});
    } catch (e) {
      debugPrint("Error loading rive file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(builder: (context, state, _) {
      return SizedBox(
        // color: Colors.red,
        height: 250,
        width: 250,
        child: artboardCodingTable != null
            ? Rive(artboard: artboardCodingTable!)
            : const SizedBox(),
      );
    });
  }
}
