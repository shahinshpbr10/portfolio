import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:portfolio/core/common/styles.dart';
import 'package:portfolio/widgets/header_text_widget.dart';

class LargeScreenLayout extends StatelessWidget {
  const LargeScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        decoration: Style.gredientDecoretion,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [HeaderTextWidget(size: size)],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
