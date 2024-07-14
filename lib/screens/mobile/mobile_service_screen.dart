import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:portfolio/widgets/myservice_widgets.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MobileServiceScreen extends StatefulWidget {
  const MobileServiceScreen({super.key});

  @override
  State<MobileServiceScreen> createState() => _MobileServiceScreenState();
}

class _MobileServiceScreenState extends State<MobileServiceScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          color: AppColors.ebony,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GradientText(
                "My Quality Services",
                colors: [AppColors.studio, AppColors.paleSlate],
                style: TextStyle(
                  fontSize: size.width *
                      0.08, // Adjusted font size for better visibility
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'We put your ideas and thus your wishes in the form of a unique web project that inspires you and your customers.',
                style: TextStyle(
                  fontSize: size.width *
                      0.02, // Adjusted font size for better readability
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Colors.white24,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                  height:
                      size.height * 0.03), // Added spacing for better layout
              MyServicesWidget(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
