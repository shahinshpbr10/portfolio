import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.002, vertical: size.height * 0.002),
      child: ListTile(
        title: Text(
          "Shahinsh P",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.05),
        ),
        subtitle: GradientText(
          "Flutter Developer + Data Analyst",
          colors: [
            AppColors.studio,
            AppColors.paleSlate,
          ],
          style: TextStyle(
              fontSize: size.width * 0.03, fontWeight: FontWeight.bold),
        ),
        leading: CircleAvatar(
          radius: size.width * 0.05,
          backgroundColor: Colors.black,
          backgroundImage: AssetImage('assets/images/profile_sqr.png'),
        ),
      ),
    );
  }
}
