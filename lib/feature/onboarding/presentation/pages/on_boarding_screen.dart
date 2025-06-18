import 'package:auvnet_internship_assessment/core/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../auth/presentation/pages/signup_screen.dart';
import '../../domain/entity/onboarding_entitiy.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void goNextPage() {
    if (currentPage < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to home or login screen
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() => currentPage = index);
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    title: pages[index].title,
                    description: pages[index].description,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: AppTextStyles.elevationButtonText,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: goNextPage,
              child: Text(
                "next",
                style: AppTextStyles.onBoardingTitleDescription,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
