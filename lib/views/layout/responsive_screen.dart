import 'package:flutter/material.dart';
import 'package:portfolio/views/home_page.dart';
import 'package:portfolio/views/layout/mobile/mobile_view.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 900) {
          return const MobileView();
        } else {
          return const HomePage();
        }
      },
    );
  }
}
