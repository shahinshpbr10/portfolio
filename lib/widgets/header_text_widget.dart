import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.07, vertical: size.height * 0.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "I am Shahinsh P",
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'),
          ),
          GradientText(
            'Developer +\nData Analyst',
            colors: [AppColors.studio, AppColors.paleSlate],
            style: TextStyle(
                fontSize: size.width * 0.040,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: size.width * 0.5,
            child: Text(
              'Passionate about creating interactive applications and analyzing data to drive decision-making.\nI specialize in crafting user-friendly interfaces and data-driven solutions.',
              style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
            ),
          )
        ],
      ),
    );
  }
}
