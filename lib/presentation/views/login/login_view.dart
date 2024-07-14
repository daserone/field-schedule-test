import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_agenda/core/theme/color_constants.dart';
import 'package:test_agenda/core/theme/text_styles.dart';
import 'package:test_agenda/core/utils/validators.dart';
import 'package:test_agenda/domain/router/router_config.dart';
import 'package:test_agenda/presentation/widgets/custom_text.dart';
import 'package:test_agenda/presentation/widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isRememberMe = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const Image(
                    image: AssetImage('assets/images/header.png'),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.only(top: 50, left: 30),
                    child: Center(
                      //back icon
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 33),
                child: CustomText('Iniciar sesión',
                    style: CustomTextStyles.customTextStylePoppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              const SizedBox(height: 5),

              //horizontal line size of iniciar text
              Container(
                margin: const EdgeInsets.only(left: 30),
                height: 2,
                width: 90,
                color: AppColors.blue,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: emailController,
                      hintText: 'johndoe@mail.com',
                      labelText: 'Email',
                      prefixIcon: SizedBox(
                        width: 40,
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Icon(
                              Icons.email_outlined,
                              color: AppColors.gray,
                              size: 18,
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: AppColors.gray.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => emailValidator(value),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Contraseña',
                      labelText: 'Contraseña',
                      prefixIcon: SizedBox(
                        width: 40,
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Icon(
                              Icons.lock_outline,
                              color: AppColors.gray,
                              size: 18,
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: AppColors.gray.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.gray,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      isPassword: true,
                      obscureText: !isPasswordVisible,
                      validator: (value) => passwordValidator(value),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isRememberMe,
                              onChanged: (value) {
                                setState(() {
                                  isRememberMe = value!;
                                });
                              },
                              activeColor: AppColors.primary,
                            ),
                            CustomText('Recordar contraseña',
                                style: CustomTextStyles.customTextStylePoppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    //forgot password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText('¿Olvidaste tu contraseña?',
                            style: CustomTextStyles.customTextStylePoppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blue,
                            )),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          //login
                          if (_formKey.currentState!.validate()) {
                            //navigate to dashboard go router
                            GoRouter.of(context)
                                .clearStackAndNavigate('/dashboard');
                          }
                        },
                        child: CustomText('Iniciar sesión',
                            style: CustomTextStyles.customTextStylePoppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            )),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText('Aun no tienes una cuenta?',
                            style: CustomTextStyles.customTextStylePoppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                        InkWell(
                          onTap: () {
                            //navigate to register go router
                            context.go('/register');
                          },
                          child: CustomText(' Regístrate',
                              style: CustomTextStyles.customTextStylePoppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.blue,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
