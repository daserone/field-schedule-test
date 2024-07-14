import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_agenda/core/theme/text_styles.dart';
import 'package:test_agenda/presentation/widgets/custom_text.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/onboarding.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.asset('assets/images/logo.png', height: 200),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: () async {
                  context.go('/login');
                },
                child: CustomText(
                  'Iniciar sesión',
                  style: CustomTextStyles.customTextStylePoppins(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(0.7)),
                onPressed: () async {
                  context.go('/register');
                },
                child: CustomText(
                  'Registrarme',
                  style: CustomTextStyles.customTextStylePoppins(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
