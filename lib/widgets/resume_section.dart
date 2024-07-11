import 'package:flutter/material.dart';
import 'package:portfolio/widgets/resume_card.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Education Column
        Expanded(
          child: Column(
            children: [
              Text(
                'Education',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ResumeCard(
                img: 'assets/images/mea.png',
                title: 'Computer Science',
                subtitle: 'MEA Engineering College / 2021-2025',
                description:
                    'Studying core computer science subjects, including programming, data structures, algorithms, and software engineering.',
              ),
              ResumeCard(
                img: 'assets/images/ktu.jpg',
                title: 'Bachelor Degree',
                subtitle:
                    'APJ Abdul Kalam Technological University / 2021 - 2025',
                description:
                    'Pursuing a Bachelor\'s degree with a focus on technical skills and practical experience in engineering disciplines.',
              ),
              ResumeCard(
                img: 'assets/images/DHSE.png',
                title: 'Higher Secondary',
                subtitle:
                    'Directorate of Higher Secondary Education / 2019 - 2021',
                description:
                    'Completed higher secondary education with a focus on science subjects, including physics, chemistry, and mathematics.',
              ),
            ],
          ),
        ),
        SizedBox(width: 40),

        // Experience Column
        Expanded(
          child: Column(
            children: [
              Text(
                'Experience',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ResumeCard(
                img: 'assets/images/profile_sqr.png',
                title: 'Technical Chief',
                subtitle: 'IEDC MEAEC / 2023 - 2025',
                description:
                    'Leading technical projects and initiatives, providing mentorship, and driving innovation within the IEDC community.',
              ),
              ResumeCard(
                img: 'assets/images/flutter.png',
                title: 'Flutter Workshop Mentor',
                subtitle: 'IEEE MEAEC / 2023 - 2025',
                description:
                    'Conducted workshops on Flutter development, teaching students the basics and advanced concepts of building cross-platform mobile applications.',
              ),
              ResumeCard(
                img: 'assets/images/ICFOSS.png',
                title: 'Machine Learning Intern',
                subtitle: 'ICFOSS / 2022 - 2023',
                description:
                    'Developed machine learning models and applied data analysis techniques using Python, contributing to various research projects at ICFOS.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
