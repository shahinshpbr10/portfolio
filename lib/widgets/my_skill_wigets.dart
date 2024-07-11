import 'package:flutter/material.dart';
import 'package:portfolio/core/common/colors.dart';

class MySkillsWidget extends StatelessWidget {
  const MySkillsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  SkillBar(skill: 'Flutter', percentage: 90),
                  SizedBox(
                    height: 10,
                  ),
                  SkillBar(skill: 'Dart', percentage: 90),
                  SizedBox(
                    height: 10,
                  ),
                  SkillBar(skill: 'UI/UX', percentage: 80),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.09,
            ),
            Expanded(
              child: Column(
                children: [
                  SkillBar(skill: 'Python', percentage: 80),
                  SizedBox(
                    height: 10,
                  ),
                  SkillBar(skill: 'Java', percentage: 75),
                  SizedBox(
                    height: 10,
                  ),
                  SkillBar(skill: 'ML', percentage: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillBar extends StatelessWidget {
  final String skill;
  final int percentage;

  const SkillBar({
    Key? key,
    required this.skill,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                '$percentage%',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Stack(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                widthFactor: percentage / 100,
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [AppColors.paleSlate, AppColors.studio]),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
