import 'package:flutter/material.dart';
import 'package:portfolio/providers/contact_service.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:portfolio/views/home_page.dart';
import 'package:provider/provider.dart';

import 'views/layout/responsive_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScreenState()),
        ChangeNotifierProvider(create: (_) => ContactService())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio',
        // home: HomePage(),
        home: ResponsiveScreen(),
      ),
    );
  }
}



//deploy commits

// git checkout gh-pages
// cp -r build/web/* .
// git add .
// git commit -m "Update deployed Flutter app"
// git push origin gh-pages
