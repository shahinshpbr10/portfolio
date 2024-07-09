import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:portfolio/core/common/styles.dart';
import 'package:portfolio/widgets/count_container_widget.dart';
import 'package:portfolio/widgets/header_text_widget.dart';
import 'package:portfolio/widgets/myservice_widgets.dart';
import 'package:portfolio/widgets/navbar/navitems.dart';
import 'package:portfolio/widgets/rotating_image_continer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({Key? key}) : super(key: key);

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0.0;
  bool isHovered = false;
  final GlobalKey _servicesKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  void _scrollToServices() {
    Scrollable.ensureVisible(
      _servicesKey.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
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
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    top: size.width * 0.01,
                    bottom: size.width * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome',
                      style: GoogleFonts.playball(
                          color: Colors.white, fontSize: size.width * 0.04),
                    ),
                    Row(
                      children: [
                        NavItem(
                          title: 'Services',
                          ontap: _scrollToServices,
                        ),
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                'Hire me!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.011,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.11),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HeaderTextWidget(size: size),
                        SizedBox(height: size.width * 0.01),
                        Social_large(size: size),
                      ],
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RotatingImageContainer(),
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CountWidget(
                      size: size,
                      text1: "5",
                      text2: "Years of",
                      text3: "Experience",
                    ),
                    CountWidget(
                      size: size,
                      text1: "28",
                      text2: "Projects",
                      text3: "Completed",
                    ),
                    CountWidget(
                      size: size,
                      text1: "1.5K",
                      text2: "Happy",
                      text3: "Customers",
                    ),
                    CountWidget(
                      size: size,
                      text1: "500+",
                      text2: "Hours of",
                      text3: "Coding",
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.17),
              AnimatedContainer(
                key: _servicesKey,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                color: _calculateContainerColor(size),
                padding: EdgeInsets.symmetric(vertical: size.width * 0.07),
                child: Column(
                  children: [
                    GradientText(
                      "My Quality Services",
                      colors: [AppColors.studio, AppColors.paleSlate],
                      style: TextStyle(
                        fontSize: size.width * 0.030,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Opacity(
                      opacity: _calculateOpacity(0.3, 0.7),
                      child: Transform.translate(
                        offset: Offset(0.0, _calculateOffset(-50, 50)),
                        child: Text(
                          'We put your ideas and thus your wishes in the form of a unique web project that inspires you and your customers.',
                          style: TextStyle(
                            fontSize: size.width * 0.012,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    MyServicesWidget(size: size),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _calculateOpacity(double startOpacity, double endOpacity) {
    double normalizedScroll = _scrollPosition / 300.0; // Adjust as needed
    return 1.0 - (normalizedScroll.clamp(0.0, 1.0) * (1.0 - startOpacity));
  }

  double _calculateOffset(double startOffset, double endOffset) {
    double normalizedScroll = _scrollPosition / 300.0; // Adjust as needed
    return (1.0 - normalizedScroll.clamp(0.0, 1.0)) * (endOffset - startOffset);
  }

  Color _calculateContainerColor(size) {
    if (_scrollPosition > size.height * 0.5) {
      // Change color when scroll position reaches a certain point (adjust 0.5 as needed)
      return AppColors.ebony;
    } else {
      return Colors.transparent;
    }
  }
}
