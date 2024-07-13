import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:portfolio/core/common/styles.dart';
import 'package:portfolio/widgets/contact_section.dart';
import 'package:portfolio/widgets/count_container_widget.dart';
import 'package:portfolio/widgets/custom_appbar.dart';
import 'package:portfolio/widgets/custom_tab_bar.dart';
import 'package:portfolio/widgets/downloadcvbutton.dart';
import 'package:portfolio/widgets/header_text_widget.dart';
import 'package:portfolio/widgets/my_skill_wigets.dart';
import 'package:portfolio/widgets/myservice_widgets.dart';
import 'package:portfolio/widgets/navbar/navitems.dart';
import 'package:portfolio/widgets/resume_header.dart';
import 'package:portfolio/widgets/resume_section.dart';
import 'package:portfolio/widgets/rotating_image_continer.dart';
import 'package:portfolio/widgets/skill_header.dart';
import 'package:portfolio/widgets/social_widgets.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout>
    with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  late Animation<double> _resumeOpacityAnimation;
  late AnimationController _resumeOpacityController;
  double _scrollPosition = 0.0;
  bool isHovered = false;
  final GlobalKey _servicesKey = GlobalKey();
  late TabController _tabController;

  final GlobalKey _worksKey = GlobalKey();
  final GlobalKey _resumeKey = GlobalKey();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _contactkey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController.addListener(_scrollListener);
    // Initialize animation controller for resume opacity
    _resumeOpacityController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _resumeOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_resumeOpacityController);

    // Start animations based on scroll position
    _startResumeAnimation();
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

  void _startResumeAnimation() {
    // Trigger animation when resume section is in view
    if (_isResumeInView()) {
      _resumeOpacityController.forward();
    } else {
      _resumeOpacityController.reverse();
    }
  }

  bool _isResumeInView() {
    // Adjust threshold as needed
    return _scrollPosition > (_resumeKey.currentContext?.size?.height ?? 0);
  }

  void _scrollToServices() {
    Scrollable.ensureVisible(
      _servicesKey.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToWorks() {
    Scrollable.ensureVisible(
      _worksKey.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToHome() {
    Scrollable.ensureVisible(
      _homeKey.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToResume() {
    Scrollable.ensureVisible(
      _resumeKey.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToContact() {
    Scrollable.ensureVisible(
      _contactkey.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        scrollTohome: _scrollToHome,
        toolbarHeight: 80,
        backgroundColor: AppColors.ebony,
        scrollToWorks: _scrollToWorks,
        scrollToResume: _scrollToResume,
        scrollToServices: _scrollToServices,
        scrollTocontact: _scrollToContact,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.04),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [RotatingImageContainer()],
                          ),
                        ),
                        SizedBox(
                          height: size.width * 0.09,
                        ),
                        Row(
                          children: [
                            HeaderTextWidget(
                              size: size,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Social_Tab(size: size)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CountWidget(
                        size: size,
                        text1: "14",
                        text2: "Years of",
                        text3: "Experience",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: AppColors.paleSlate,
                        indent: size.width * 0.05,
                        endIndent: size.width * 0.05,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CountWidget(
                        size: size,
                        text1: "50+",
                        text2: "Projects",
                        text3: "Completed",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: AppColors.paleSlate,
                        indent: size.width * 0.05,
                        endIndent: size.width * 0.05,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CountWidget(
                        size: size,
                        text1: "1.5K",
                        text2: "Happy",
                        text3: "Customers",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: AppColors.paleSlate,
                        indent: size.width * 0.05,
                        endIndent: size.width * 0.05,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CountWidget(
                        size: size,
                        text1: "1M",
                        text2: "Awesome",
                        text3: "Reviews",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.15),
                AnimatedContainer(
                  key: _servicesKey,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  color: _calculateContainerColor(size, 0.5),
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
                Container(
                  key: _worksKey,
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        padding:
                            EdgeInsets.symmetric(vertical: size.width * 0.05),
                        child: Column(
                          children: [
                            GradientText(
                              "My Recent Works",
                              colors: [AppColors.studio, AppColors.paleSlate],
                              style: TextStyle(
                                fontSize: size.width * 0.030,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.05),
                            CustomTabBar(tabController: _tabController),
                            SizedBox(height: size.height * 0.05),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        height: size.height,
                        child: CustomeTabBarView(
                            tabController: _tabController, size: size),
                      ),
                      Container(
                        color: AppColors.ebony,
                        key: _resumeKey,
                        padding: EdgeInsets.only(top: size.width * 0.02),
                        child: Column(
                          children: [
                            ResumeHeader(size: size),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03),
                                child: ResumeSection(size: size),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SkillHeader(size: size),
                            MySkillsWidget(),
                            SizedBox(height: size.height * 0.1),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      Container(
                          key: _contactkey,
                          child: Column(
                            children: [
                              SizedBox(height: size.height * 0.07),
                              ContactSection(size: size),
                              SizedBox(height: size.height * 0.07),
                              SocialWidget(),
                              SizedBox(height: size.height * 0.03),
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
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

  Color _calculateContainerColor(Size size, double threshold) {
    if (_scrollPosition > size.height * threshold) {
      return AppColors.ebony; // Change to desired color
    } else {
      return Colors.transparent;
    }
  }
}

class Social_Tab extends StatelessWidget {
  const Social_Tab({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DownloadCVButton(),
          SizedBox(
            height: 20,
          ),
          SocialWidget(),
        ],
      ),
    );
  }
}
