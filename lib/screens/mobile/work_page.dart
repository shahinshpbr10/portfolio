import 'package:flutter/material.dart';
import 'package:portfolio/core/common/styles.dart';
import 'package:portfolio/widgets/custom_tab_bar.dart';
import 'package:portfolio/widgets/tab_bar_mobile.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../core/common/colors.dart';

class WorkMobilePage extends StatefulWidget {
  const WorkMobilePage({super.key});

  @override
  State<WorkMobilePage> createState() => _WorkMobilePageState();
}

late TabController _tabController;
final GlobalKey _worksKey = GlobalKey();

class _WorkMobilePageState extends State<WorkMobilePage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            decoration: Styles.gradientDecoration,
            key: _worksKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                  child: Column(
                    children: [
                      GradientText(
                        "My Recent Works",
                        colors: [AppColors.studio, AppColors.paleSlate],
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'We put your ideas and thus your wishes in the form of a unique web project that inspires you and your customers.',
                          style: TextStyle(
                            fontSize: size.width * 0.02,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.1,
                      ),
                      CustomTabBarMobile(tabController: _tabController),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  height: size.height,
                  child: CustomTabBarViewMobile(
                      tabController: _tabController, size: size),
                )
              ]),
            )));
  }
}
