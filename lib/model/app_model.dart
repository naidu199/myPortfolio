import 'package:flutter/material.dart';

class AppModel {
  final String appName;
  final String? assetPath;
  final IconData? iconData;
  final Color color;
  final Widget? widget;
  final String? link;
  AppModel(
      {required this.appName,
      this.assetPath,
      this.iconData,
      required this.color,
      this.widget,
      this.link})
      : assert(iconData != null || assetPath != null);
}
