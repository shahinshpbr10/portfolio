import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:portfolio/core/common/styles.dart';
import 'package:portfolio/widgets/count_container_widget.dart';
import 'package:portfolio/widgets/custom_tab_bar.dart';
import 'package:portfolio/widgets/header_text_widget.dart';
import 'package:portfolio/widgets/myservice_widgets.dart';
import 'package:portfolio/widgets/navbar/navitems.dart';
import 'package:portfolio/widgets/resume_card.dart';
import 'package:portfolio/widgets/resume_header.dart';
import 'package:portfolio/widgets/rotating_image_continer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({Key? key}) : super(key: key);

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0.0;
  bool isHovered = false;
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _resumeKey = GlobalKey();
  final GlobalKey _worksKey = GlobalKey(); // Add this line

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _tabController.dispose();
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

  void _scrollToWorks() {
    Scrollable.ensureVisible(
      _worksKey.currentContext!,
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
              //Heading Nav bar
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
                        NavItem(
                          title: 'Works',
                          ontap: _scrollToWorks,
                        ), // Update this line
                        NavItem(
                          title: 'Resume',
                          ontap: _scrollToResume,
                        ),
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
                        ) //Heading Nav bar End
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
              //Welcome end

              //services Start
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
              ), //Services End
              //Work Start
              Container(
                key: _worksKey, // Add this line
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      padding:
                          EdgeInsets.symmetric(vertical: size.width * 0.05),
                      child: Column(
                        children: [
                          GradientTextWidget(
                            size: size,
                            text1: "My Recent Works",
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          CustomTabBar(tabController: _tabController)
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      height: size.height,
                      child: CustomeTabBarView(
                          tabController: _tabController, size: size),
                    )
                  ],
                ),
              ), //Work End
              SizedBox(height: size.height * 0.05),
              AnimatedContainer(
                key: _resumeKey,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                padding: EdgeInsets.only(top: size.width * 0.05),
                color: Colors.black,
                child: Column(
                  children: [
                    ResumeHeader(size: size),
                    Align(
                        alignment: Alignment.center,
                        child: ResumeSection(size: size))
                  ],
                ),
              )
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

class ResumeSection extends StatelessWidget {
  const ResumeSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Education Column
        Expanded(
          child: Column(
            children: [
              Text(
                'Education',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ResumeCard(
                img: 'assets/images/mea.png',
                title: 'Computer Science',
                subtitle: 'MEA Engineering College / 2021-2025',
                description:
                    'Studying core computer science subjects, including programming, data structures, algorithms, and software engineering.',
              ),
              ResumeCard(
                img: 'assets/images/ktu.jpg',
                title: 'Bachelor Degree',
                subtitle:
                    'APJ Abdul Kalam Technological University / 2021 - 2025',
                description:
                    'Pursuing a Bachelor\'s degree with a focus on technical skills and practical experience in engineering disciplines.',
              ),
              ResumeCard(
                img: 'assets/images/DHSE.png',
                title: 'Higher Secondary',
                subtitle:
                    'Directorate of Higher Secondary Education / 2019 - 2021',
                description:
                    'Completed higher secondary education with a focus on science subjects, including physics, chemistry, and mathematics.',
              ),
            ],
          ),
        ),
        SizedBox(width: 40),

        // Experience Column
        Expanded(
          child: Column(
            children: [
              Text(
                'Experience',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ResumeCard(
                img: 'assets/images/profile_sqr.png',
                title: 'Technical Chief',
                subtitle: 'IEDC MEAEC / 2023 - 2025',
                description:
                    'Leading technical projects and initiatives, providing mentorship, and driving innovation within the IEDC community.',
              ),
              ResumeCard(
                img: 'assets/images/flutter.png',
                title: 'Flutter Workshop Mentor',
                subtitle: 'IEEE MEAEC / 2023 - 2025',
                description:
                    'Conducted workshops on Flutter development, teaching students the basics and advanced concepts of building cross-platform mobile applications.',
              ),
              ResumeCard(
                img: 'assets/images/ICFOSS.png',
                title: 'Machine Learning Intern',
                subtitle: 'ICFOSS / 2022 - 2023',
                description:
                    'Developed machine learning models and applied data analysis techniques using Python, contributing to various research projects at ICFOS.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
