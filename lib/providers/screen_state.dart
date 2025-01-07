import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/views/mobile_screen.dart';
import 'package:portfolio/views/tab_screen.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenState extends ChangeNotifier {
  ScreenState() {
    loadAnimation(); //for the rive animation
    // loadAnimationCodingTable();
  }
  DeviceInfo _deviceInfo = Devices.ios.iPhone13ProMax;
  DeviceInfo get deviceInfo => _deviceInfo;
  bool isTabScreen = false;
  void changeScreen(int index) {
    _deviceInfo = devices[index].device;
    _currentScreen = index == 2 ? const TabScreen() : const MobileScreen();
    isTabScreen = index == 2 ? true : false;
    _isMainScreen = true;
    notifyListeners();
  }

  int _colorIndex = 0;
  int get colorIndex => _colorIndex;
  void changeColorPallet(int index) {
    _colorIndex = index;
    notifyListeners();
  }

  Future<void> launchAppUrl(String url) async {
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    } else {
      throw 'Could not launch $url';
    }
  }

  bool _isMainScreen = true;
  bool get isMainScreen => _isMainScreen;
  Widget _currentScreen = const MobileScreen();
  Widget get currentScreen => _currentScreen;
  String title = '';
  void setCurrentScreen(Widget screen, bool isMain) {
    _currentScreen = screen;
    _isMainScreen = isMain;
    notifyListeners();
  }

  final String email = 'narasimhanaidu1909@gmail.com';
  void launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: Uri.encodeFull(
          'subject=Hello&body=I am writing to you...'), // Optional query params
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not found email';
    }
  }

//Rive animation bird

  Artboard? artboard;
  SMIBool? isDance;
  SMITrigger? isLookUp;
  StateMachineController? controller;

  final String asset = "assets/animations/rive/birb.riv";

  Future<void> loadAnimation() async {
    try {
      final riveFile = await RiveFile.asset(asset);

      final artboard = riveFile.mainArtboard;
      controller = StateMachineController.fromArtboard(artboard, "birb");
      if (controller != null) {
        artboard.addController(controller!);
        isDance = controller!.findSMI("dance");
        isLookUp = controller!.findSMI("look up");
      }
      this.artboard = artboard;
      notifyListeners();
    } catch (e) {
      debugPrint("Error loading rive file: $e");
    }
  }

  void toggleDance() {
    if (isDance != null) {
      isDance!.value = !isDance!.value;
      notifyListeners();
    }
  }

  void toggleLookUp() {
    if (isLookUp != null) {
      isLookUp!.fire();
      notifyListeners();
    }
  }

  //Rive animation coding table
}
