import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialWidget extends StatelessWidget {
  SocialWidget({super.key});

  // Define the URLs for the social media profiles
  final Uri linkedInUrl =
      Uri.parse('https://www.linkedin.com/in/shahinsh-p-830aa0241');
  final Uri instagramUrl = Uri.parse(
      'https://www.instagram.com/shahinsh.pbr?igsh=MTEwcndlaWFuMzh0Yg==');
  final Uri whatsappUrl = Uri.parse('https://wa.me/916238348992');
  final Uri githubUrl = Uri.parse('https://github.com/shahinshpbr10');

  // Function to launch a URL
  Future<void> _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.studio.withOpacity(0.5)),
          ),
          child: Center(
            child: IconButton(
              hoverColor: AppColors.paleSlate,
              onPressed: () => _launchURL(linkedInUrl),
              icon: FaIcon(
                FontAwesomeIcons.linkedinIn,
                color: AppColors.studio,
                size: 15,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.studio.withOpacity(0.5)),
          ),
          child: Center(
            child: IconButton(
              hoverColor: AppColors.paleSlate,
              onPressed: () => _launchURL(instagramUrl),
              icon: FaIcon(
                FontAwesomeIcons.instagram,
                color: AppColors.studio,
                size: 15,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.studio.withOpacity(0.5)),
          ),
          child: Center(
            child: IconButton(
              hoverColor: AppColors.paleSlate,
              onPressed: () => _launchURL(whatsappUrl),
              icon: FaIcon(
                FontAwesomeIcons.whatsapp,
                color: AppColors.studio,
                size: 15,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.studio.withOpacity(0.5)),
          ),
          child: Center(
            child: IconButton(
              hoverColor: AppColors.paleSlate,
              onPressed: () => _launchURL(githubUrl),
              icon: FaIcon(
                FontAwesomeIcons.github,
                color: AppColors.studio,
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
