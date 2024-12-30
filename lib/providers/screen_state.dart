import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/views/mobile_screen.dart';
import 'package:portfolio/views/tab_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenState extends ChangeNotifier {
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

  int _colorIndex = 1;
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
}
