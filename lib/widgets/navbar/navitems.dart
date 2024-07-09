import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';

class NavItem extends StatefulWidget {
  final String title;
  final VoidCallback? ontap;

  NavItem({required this.title, this.ontap});

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MouseRegion(
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
      child: GestureDetector(
        onTap: widget.ontap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.015, vertical: size.width * 0.005),
          decoration: BoxDecoration(
            color: isHovered
                ? AppColors.rouge.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: TextStyle(
              color: isHovered ? AppColors.studio : Colors.white,
              fontSize: size.width * 0.011,
              fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
              shadows: isHovered
                  ? [Shadow(color: AppColors.capeCod, blurRadius: 10)]
                  : [],
            ),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}
