import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:portfolio/screens/mobile/mobile_service_screen.dart';
import 'package:portfolio/widgets/sidemenumobile/info_card.dart';
import 'package:portfolio/widgets/sidemenumobile/side_menu_tile.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String activeTile = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.ebony, AppColors.studio]),
      ),
      width: size.width * 0.8,
      height: double.infinity,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoCard(size: size),
            SizedBox(
              height: size.width * 0.02,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.white24,
              thickness: 1.5,
            ),
            SideMenuTile(
              size: size,
              icon: Icons.design_services_rounded,
              text: 'Services',
              isActive: activeTile == 'Services',
              ontap: () {
                setState(() {
                  activeTile = 'Services';
                });
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) {
                    return MobileServiceScreen();
                  },
                ));
              },
            ),
            SideMenuTile(
              size: size,
              icon: Icons.work_outline,
              text: 'Works',
              isActive: activeTile == 'Works',
              ontap: () {
                setState(() {
                  activeTile = 'Works';
                });
              },
            ),
            SideMenuTile(
              size: size,
              icon: Icons.note_rounded,
              text: 'Resume',
              isActive: activeTile == 'Resume',
              ontap: () {
                setState(() {
                  activeTile = 'Resume';
                });
              },
            ),
            SideMenuTile(
              size: size,
              icon: Icons.skateboarding,
              text: 'Skills',
              isActive: activeTile == 'Skills',
              ontap: () {
                setState(() {
                  activeTile = 'Skills';
                });
              },
            ),
            SideMenuTile(
              size: size,
              icon: Icons.phone_android_outlined,
              text: 'Contact',
              isActive: activeTile == 'Contact',
              ontap: () {
                setState(() {
                  activeTile = 'Contact';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
