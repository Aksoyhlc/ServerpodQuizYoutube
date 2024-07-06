import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qyt_flutter/Const/const.dart';
import 'package:qyt_flutter/Mixins/state_tools.dart';
import 'package:qyt_flutter/Views/Auth/Forms/email_validation.dart';
import 'package:qyt_flutter/Views/Auth/Forms/reset_password.dart';

import 'Forms/login.dart';
import 'Forms/register.dart';
import 'Widgets/logo.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with StateTools {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthLogo(),
            Container(
              constraints: BoxConstraints(
                maxHeight: context.height * 0.45,
              ),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: whiteColor,
                    blurRadius: 5,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Obx(
                () {
                  if (ac.authType.value == AuthType.login)
                    return const LoginForm();
                  if (ac.authType.value == AuthType.register)
                    return const RegisterForm();
                  if (ac.authType.value == AuthType.resetPassword)
                    return const ResetPassword();
                  if (ac.authType.value == AuthType.emailValidation)
                    return const RegisterValidationForm();
                  return const LoginForm();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
