import 'package:auvnet_internship_assessment/core/common/helper/service_locator.dart';
import 'package:auvnet_internship_assessment/core/config/assets/app_images.dart';
import 'package:auvnet_internship_assessment/feature/auth/domain/entity/user_entity.dart';
import 'package:auvnet_internship_assessment/feature/auth/domain/usecase/signin_usecase.dart';
import 'package:auvnet_internship_assessment/feature/auth/presentation/pages/signup_screen.dart';
import 'package:auvnet_internship_assessment/feature/auth/presentation/widgets/auth_button.dart';
import 'package:auvnet_internship_assessment/feature/auth/presentation/widgets/auth_text_field.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/pages/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

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
              obscureText: true ,
            ),
            SizedBox(height: 18.h),
            AuthButton(
              onPressed: () async {
                var result = await sl<SignInUseCase>().call(
                  UserEntity(
                    email: emailController.text.trim(),
                    password: passwordController.text,
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
                      MaterialPageRoute(builder: (context) => const HomeLayout()),
                    );
                  },
                );
              },
              text: "Sign In",
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: Text(
                "create a new account",
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
