import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:portfolio/core/common/styles.dart';
import 'package:portfolio/widgets/navbar/navitems.dart';

class NavbarLarge extends StatefulWidget {
  @override
  State<NavbarLarge> createState() => _NavbarLargeState();
}

class _NavbarLargeState extends State<NavbarLarge> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: IconButton(
                onPressed: () {}, icon: FaIcon(FontAwesomeIcons.mailForward))),
        SizedBox(width: 10),
        Text(
          'mail@paramboorshahinsh@gmail.com',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontFamily: 'Poppins'),
        ),
        SizedBox(
          width: size.width * 0.10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavItem(title: 'Services'),
            NavItem(title: 'Works'),
            NavItem(title: 'Resume'),
            NavItem(title: 'Skills'),
            NavItem(title: 'Contact'),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isHovered
                      ? [AppColors.studio, AppColors.ebony]
                      : [AppColors.ebony, AppColors.studio],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.studio),
              ),
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHovered = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHovered = false;
                  });
                },
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Hire me!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
