import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';
import 'package:portfolio/widgets/text_widget.dart';

class CustomTabBarMobile extends StatelessWidget {
  final TabController tabController;
  const CustomTabBarMobile({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9, // Adjusted width for mobile screens
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
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        indicatorColor: AppColors.studio,
        tabs: [
          Tab(text: "All"),
          Tab(text: 'Apps'),
          Tab(text: 'UI/UX'),
          Tab(text: 'ML Models'),
        ],
      ),
    );
  }
}

class CustomTabBarViewMobile extends StatelessWidget {
  final TabController tabController;
  final Size size;
  const CustomTabBarViewMobile(
      {super.key, required this.tabController, required this.size});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        AllProjectsMobile(size: size),
        AllProjectsMobile(size: size),
        AllProjectsMobile(size: size),
        AllProjectsMobile(size: size),
      ],
    );
  }
}

class AllProjectsMobile extends StatelessWidget {
  final Size size;
  const AllProjectsMobile({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjusted crossAxisCount for mobile
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemCount: 6, // Number of ProjectCards
          itemBuilder: (context, index) {
            return ProjectCardMobile();
          },
        ),
      ),
    );
  }
}

class ProjectCardMobile extends StatelessWidget {
  const ProjectCardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: size.width * 0.8, // Adjusted width for mobile screens
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
                  width: double.infinity,
                  height:
                      size.height * 0.25, // Adjusted height for mobile screens
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.7),
                  ),
                  padding: EdgeInsets.all(10), // Adjusted padding for mobile
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "App Development",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
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
    );
  }
}
