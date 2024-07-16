import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _sendMail() async {
    if (_formKey.currentState!.validate()) {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'paramboorshahinsh@gmail.com',
        query: encodeQueryParameters(<String, String>{
          'subject': _subjectController.text.isEmpty
              ? 'New Portfolio Contact'
              : _subjectController.text,
          'body': '''
From: ${_nameController.text}
Email: ${_emailController.text}

Message:
${_messageController.text}
          '''
        }),
      );

      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch email client')),
        );
      }
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

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
                  fontSize: widget.size.width * 0.030,
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
                padding: EdgeInsets.only(left: widget.size.width * 0.15),
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
                    color: AppColors.valhalla,
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
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
                      controller: _nameController,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: AppColors.studio),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.studio),
                        ),
                        labelText: 'Email address*',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _subjectController,
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
                      controller: _messageController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: AppColors.studio),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.studio),
                        ),
                        labelText: 'Tell us more about your project*',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your message';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: _sendMail,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.studio,
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
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
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
