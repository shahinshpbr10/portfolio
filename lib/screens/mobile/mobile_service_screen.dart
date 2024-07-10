import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:portfolio/widgets/myservice_widgets.dart';

class MobileServiceScreen extends StatelessWidget {
  const MobileServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: AppColors.ebony,
        child: MyServicesWidget(size: size),
      ),
    );
  }
}
