import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:portfolio/widgets/navbar/navitems.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final dynamic backgroundColor;
  final VoidCallback? scrollToServices;
  final VoidCallback? scrollToWorks;
  final VoidCallback? scrollTohome;
  final VoidCallback? scrollToResume;
  final VoidCallback? scrollTocontact;
  final double? toolbarHeight;

  CustomAppBar({
    required this.backgroundColor,
    this.scrollToServices,
    this.scrollToWorks,
    this.scrollToResume,
    this.toolbarHeight,
    this.scrollTohome,
    this.scrollTocontact,
  });

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: widget.toolbarHeight,
      child: IntrinsicHeight(
        child: Container(
          decoration: BoxDecoration(
            gradient: widget.backgroundColor is List<Color>
                ? LinearGradient(
                    colors: widget.backgroundColor,
                  )
                : null,
            color:
                widget.backgroundColor is Color ? widget.backgroundColor : null,
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.ebony,
                    radius: size.width * 0.02,
                    backgroundImage:
                        AssetImage('assets/images/profile_sqr.png'),
                  ),
                  Row(
                    children: [
                      NavItem(
                        title: 'Home',
                        ontap: widget.scrollTohome,
                      ),
                      NavItem(
                        title: 'Services',
                        ontap: widget.scrollToServices,
                      ),
                      NavItem(
                        title: 'Works',
                        ontap: widget.scrollToWorks,
                      ),
                      NavItem(
                        title: 'Resume',
                        ontap: widget.scrollToResume,
                      ),
                      NavItem(title: 'Contact', ontap: widget.scrollTocontact),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: isHovered
                                ? [AppColors.studio, AppColors.ebony]
                                : [AppColors.ebony, AppColors.studio],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.studio),
                        ),
                        child: MouseRegion(
                          onEnter: (_) => setState(() => isHovered = true),
                          onExit: (_) => setState(() => isHovered = false),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              'Hire me!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.011,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
