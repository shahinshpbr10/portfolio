import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:portfolio/core/common/styles.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ContactPageMobile extends StatefulWidget {
  const ContactPageMobile({super.key});

  @override
  State<ContactPageMobile> createState() => _ContactPageMobileState();
}

class _ContactPageMobileState extends State<ContactPageMobile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: Styles.gradientDecoration,
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GradientText(
                "Let's chat.\nTell me about your \nProject.",
                style: TextStyle(
                  fontSize: size.width * 0.08,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                colors: [
                  AppColors.studio,
                  AppColors.paleSlate,
                ],
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: AppColors.studio.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // Handle email icon button press
                        },
                        icon: Icon(
                          Icons.email_outlined,
                          color: AppColors.studio,
                          size: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mail me at',
                          style: TextStyle(color: Colors.white30, fontSize: 12),
                        ),
                        Text(
                          'paramboorshahinsh@gmail.com',
                          style: TextStyle(
                            color: AppColors.paleSlate,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 3,
                        color: AppColors.valhalla,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Send us a message🚀',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.studio,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.studio),
                          ),
                          labelText: 'Full name*',
                          labelStyle: TextStyle(color: AppColors.studio),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.studio),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: AppColors.studio),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.studio),
                          ),
                          labelText: 'Email address*',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: AppColors.studio),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.studio),
                          ),
                          labelText: 'Subject',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: AppColors.studio),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.studio),
                          ),
                          labelText: 'Tell us more about your project*',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.studio, // Button color
                            padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                          ),
                          child: Text(
                            'Send message',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
