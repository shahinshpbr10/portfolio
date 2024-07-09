import 'package:flutter/material.dart';
import 'package:portfolio/widgets/navbar/navitems.dart';

class NavbarTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Text(
                'G',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 10),
            Text(
              'mail@gerolddesign.com',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
        Row(
          children: [
            NavItem(title: 'Services'),
            NavItem(title: 'Works'),
            NavItem(title: 'Resume'),
            NavItem(title: 'Skills'),
            NavItem(title: 'Testimonials'),
            NavItem(title: 'Contact'),
          ],
        )
      ],
    );
  }
}
