import 'package:flutter/material.dart';
import 'package:portfolio/screens/desktop/large_screen_layout.dart';
import 'package:portfolio/screens/mobile/mobile_screen_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 950) {
            return LargeScreenLayout();
          } else {
            return MobileLayout();
          }
        },
      ),
    );
  }
}
