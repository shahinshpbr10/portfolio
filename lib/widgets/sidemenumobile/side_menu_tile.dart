import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
    required this.size,
    required this.text,
    required this.icon,
    this.ontap,
    this.isActive = false,
  });

  final Size size;
  final String text;
  final IconData icon;
  final VoidCallback? ontap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 56,
            width: isActive ? size.width * 0.7 : size.width * 0.6,
            decoration: BoxDecoration(
              gradient: isActive
                  ? LinearGradient(
                      colors: [AppColors.revolver, AppColors.studio],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: isActive ? null : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: ListTile(
                leading: SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(
                    icon,
                    color: Colors.white.withOpacity(0.5),
                    size: size.width * 0.07,
                  ),
                ),
                title: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white.withOpacity(0.5),
                    fontSize: size.width * 0.05,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.white24,
          thickness: 0.2,
        ),
      ],
    );
  }
}
