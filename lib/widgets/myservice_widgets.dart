import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:portfolio/widgets/text_widget.dart';

class MyServicesWidget extends StatefulWidget {
  final Size size;
  const MyServicesWidget({super.key, required this.size});

  @override
  State<MyServicesWidget> createState() => _MyServicesWidgetState();
}

class _MyServicesWidgetState extends State<MyServicesWidget> {
  List<bool> _isHovered = [false, false, false, false];

  final List<String> _serviceTitles = [
    "UI/UX Design",
    "Flutter Development",
    "Data Analysis",
    "Machine Learning"
  ];

  final List<String> _serviceDescriptions = [
    "Creating user-friendly and visually appealing interfaces that enhance user experience and engagement.",
    "Building high-performance mobile applications with Flutter, delivering smooth and responsive user experiences.",
    "Analyzing data to extract meaningful insights and drive informed decision-making using Python and other data analysis tools.",
    "Developing machine learning models to solve complex problems and improve business outcomes."
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _serviceTitles.length,
      itemBuilder: (context, index) {
        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered[index] = true),
          onExit: (_) => setState(() => _isHovered[index] = false),
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
            width: widget.size.width,
            decoration: BoxDecoration(
              color: _isHovered[index] ? null : Colors.transparent,
              border: Border.all(
                color: _isHovered[index]
                    ? AppColors.studio.withOpacity(0.5)
                    : Colors.transparent,
              ),
              gradient: _isHovered[index]
                  ? LinearGradient(colors: [
                      AppColors.studio,
                      AppColors.ebony,
                    ])
                  : null,
            ),
            child: widget.size.width > 600
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget(
                        sSize: widget.size,
                        text: "${index + 1}",
                        size: 28,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: widget.size.height * 0.04,
                      ),
                      TextWidget(
                        sSize: widget.size,
                        text: _serviceTitles[index],
                        size: 22,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: widget.size.height * 0.08,
                      ),
                      Flexible(
                        child: TextWidget(
                          sSize: widget.size,
                          text: _serviceDescriptions[index],
                          size: 16,
                          color: Colors.white,
                          alignment: TextAlign.left,
                        ),
                      ),
                      FaIcon(
                        _isHovered[index]
                            ? FontAwesomeIcons.arrowTrendUp
                            : FontAwesomeIcons.arrowTrendDown,
                        color:
                            _isHovered[index] ? Colors.white : AppColors.studio,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget(
                        sSize: widget.size,
                        text: "${index + 1}",
                        size: 22,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: widget.size.height * 0.04,
                      ),
                      TextWidget(
                        sSize: widget.size,
                        text: _serviceTitles[index],
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: widget.size.height * 0.08,
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        children: [
                          TextWidget(
                            alignment: TextAlign.left,
                            sSize: widget.size,
                            text: _serviceDescriptions[index],
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
