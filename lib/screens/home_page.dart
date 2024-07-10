import 'package:flutter/material.dart';
import 'package:portfolio/screens/desktop/large_screen_layout.dart';
import 'package:portfolio/screens/mobile/mobile_screen_layout.dart';
import 'package:portfolio/screens/tablet/tablet_layout.dart';
import 'package:portfolio/widgets/sidemenumobile/side_menu_mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 950) {
        return DesktopLayout();
      } else if (constraints.maxWidth > 600) {
        return TabletLayout();
      } else {
        return MobileLayout();
      }
    });
  }
}
