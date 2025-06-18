import 'package:auvnet_internship_assessment/core/common/helper/service_locator.dart';
import 'package:auvnet_internship_assessment/core/config/assets/app_images.dart';
import 'package:auvnet_internship_assessment/feature/auth/domain/entity/user_entity.dart';
import 'package:auvnet_internship_assessment/feature/auth/domain/usecase/signup_usecase.dart';
import 'package:auvnet_internship_assessment/feature/auth/presentation/pages/signin_page.dart';
import 'package:auvnet_internship_assessment/feature/auth/presentation/widgets/auth_button.dart';
import 'package:auvnet_internship_assessment/feature/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final userName = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Image.asset(AppImages.appLogo, width: 340.w, height: 340.h),
            AuthTextField(
              icon: Icons.person_2_outlined,
              hintText: "User Name",
              controller: userName,
            ),
            SizedBox(height: 7.h),
            AuthTextField(
              icon: Icons.email_outlined,
              hintText: "email",
              controller: emailController,
            ),
            SizedBox(height: 7.h),
            AuthTextField(
              icon: Icons.lock_outline,
              hintText: "password",
              controller: passwordController,
              obscureText: true,
            ),
            SizedBox(height: 18.h),
            AuthButton(
              onPressed: () async {
                var result = await sl<SignUpUseCase>().call(
                  UserEntity(
                    email: emailController.text.trim(),
                    password: passwordController.text,
                    name: userName.text,
                  ),
                );
                result.fold(
                  (l) {
                    return ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(l.message)));
                  },
                  (r) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SigninScreen()),
                    );
                  },
                );
              },
              text: "Sign Up",
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SigninScreen()),
                );
              },
              child: Text(
                "Already have an account? Sign In",
                style: TextStyle(
                  color: const Color(0xff1877F2),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
