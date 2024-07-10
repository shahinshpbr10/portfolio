import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ResumeHeader extends StatelessWidget {
  const ResumeHeader({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientText(
              "Resume",
              colors: [AppColors.studio, AppColors.paleSlate],
              style: TextStyle(
                fontSize: size.width * 0.030,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.02),
        Text(
          'Check Out My Resume',
          style: TextStyle(
            fontSize: size.width * 0.012,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Colors.white24,
          ),
          textAlign: TextAlign.center,
        ),
        LoadingAnimationWidget.newtonCradle(
          color: AppColors.studio,
          size: size.width * 0.05,
        )
      ],
    );
  }
}
