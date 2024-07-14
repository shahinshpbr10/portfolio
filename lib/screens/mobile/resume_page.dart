import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:portfolio/widgets/my_skill_wigets.dart';
import 'package:portfolio/widgets/resume_header.dart';
import 'package:portfolio/widgets/resume_section.dart';
import 'package:portfolio/widgets/skill_header.dart';

class ResumePageMobile extends StatefulWidget {
  const ResumePageMobile({super.key});

  @override
  State<ResumePageMobile> createState() => _ResumePageMobileState();
}

class _ResumePageMobileState extends State<ResumePageMobile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                color: AppColors.ebony,
                padding: EdgeInsets.only(top: size.width * 0.02),
                child: Column(
                  children: [
                    ResumeHeader(size: size),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
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
            ],
          ),
        ),
      ),
    );
  }
}
