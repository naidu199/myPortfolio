import 'package:flutter/material.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:portfolio/views/home_page.dart';
import 'package:provider/provider.dart';

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
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio',
        home: HomePage(),
      ),
    );
  }
}