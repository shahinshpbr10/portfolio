import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:portfolio/widgets/text_widget.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  const CustomTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.36,
      decoration: BoxDecoration(
        color: AppColors.ebony,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: TabBar(
          dividerColor: Colors.transparent,
          controller: tabController,
          tabs: [
            Tab(
              text: "All",
            ),
            Tab(
              text: 'Apps',
            ),
            Tab(
              text: 'UI/UX',
            ),
            Tab(
              text: 'Ml Models',
            ),
          ]),
    );
  }
}

class CustomeTabBarView extends StatelessWidget {
  final TabController tabController;
  final Size size;
  const CustomeTabBarView(
      {super.key, required this.tabController, required this.size});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        AllProjects(
          size: size,
        ),
        AllProjects(
          size: size,
        ),
        AllProjects(
          size: size,
        ),
        AllProjects(
          size: size,
        ),
      ],
    );
  }
}

class AllProjects extends StatelessWidget {
  final Size size;
  const AllProjects({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GridView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 100,
              childAspectRatio: 3 / 3),
          children: [ProjectCard(), ProjectCard(), ProjectCard()],
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/project_img.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  bottom: _isHovered ? 0 : -size.height * 0.2,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.7),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "App Development",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Handle button press
                          },
                          child: Text("Click to visit"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
