import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GradientText(
                "Let's chat.\nTell me about your \nProject.",
                style: TextStyle(
                  fontSize: size.width * 0.030,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                colors: [
                  AppColors.studio,
                  AppColors.paleSlate,
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.15),
                child: Row(
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
                        hoverColor: AppColors.paleSlate,
                        onPressed: () {},
                        icon: Icon(
                          Icons.email_outlined,
                          color: AppColors.studio,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mail me at',
                          style: TextStyle(color: Colors.white30),
                        ),
                        Text(
                          'paramboorshahinsh@gmail.com',
                          style: TextStyle(color: AppColors.paleSlate),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 3,
                        color: AppColors.valhalla)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          borderSide: BorderSide(color: AppColors.studio)),
                      labelText: 'Full name*',
                      labelStyle: TextStyle(color: AppColors.studio),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.studio)),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: AppColors.studio),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.studio)),
                      labelText: 'Email address*',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: AppColors.studio),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.studio)),
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
                          borderSide: BorderSide(color: AppColors.studio)),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
        )
      ],
    );
  }
}
