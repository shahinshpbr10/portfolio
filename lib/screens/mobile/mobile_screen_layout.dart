import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:portfolio/core/common/styles.dart';
import 'package:portfolio/screens/tablet/tablet_layout.dart';
import 'package:portfolio/widgets/count_container_widget.dart';
import 'package:portfolio/widgets/header_text_widget.dart';
import 'package:portfolio/widgets/myservice_widgets.dart';
import 'package:portfolio/widgets/rotating_image_continer.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _slideAnimation =
        Tween<Offset>(begin: Offset(0.0, -0.5), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.18),
              SlideTransition(
                position: _slideAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotatingImageContainer(),
                  ],
                ),
              ),
              SizedBox(height: size.width * 0.09),
              FadeTransition(
                opacity: _opacityAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HeaderTextWidget(size: size),
                    SizedBox(height: 20),
                    Social_Tab(size: size),
                  ],
                ),
              ),
              SizedBox(height: size.width * 0.09),
              Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CountWidget(
                      size: size,
                      text1: "4",
                      text2: "Years of",
                      text3: "Experience",
                    ),
                    SizedBox(height: 20),
                    Divider(
                      color: AppColors.paleSlate,
                      indent: size.width * 0.05,
                      endIndent: size.width * 0.05,
                    ),
                    SizedBox(height: 20),
                    CountWidget(
                      size: size,
                      text1: "28+",
                      text2: "Projects",
                      text3: "Completed",
                    ),
                    SizedBox(height: 20),
                    Divider(
                      color: AppColors.paleSlate,
                      indent: size.width * 0.05,
                      endIndent: size.width * 0.05,
                    ),
                    SizedBox(height: 20),
                    CountWidget(
                      size: size,
                      text1: "1.5K",
                      text2: "Happy",
                      text3: "Customers",
                    ),
                    SizedBox(height: 20),
                    Divider(
                      color: AppColors.paleSlate,
                      indent: size.width * 0.05,
                      endIndent: size.width * 0.05,
                    ),
                    SizedBox(height: 20),
                    CountWidget(
                      size: size,
                      text1: "500+",
                      text2: "Hours of",
                      text3: "Coding",
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.width * 0.09),
              Container(
                color: AppColors.ebony,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: MyServicesWidget(size: size),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
