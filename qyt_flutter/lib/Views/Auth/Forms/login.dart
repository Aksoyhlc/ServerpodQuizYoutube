import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qyt_flutter/Const/const.dart';
import 'package:qyt_flutter/Extensions/list.dart';
import 'package:qyt_flutter/Extensions/num.dart';
import 'package:qyt_flutter/Extensions/string.dart';
import 'package:qyt_flutter/Helpers/ext.dart';
import 'package:qyt_flutter/Mixins/state_tools.dart';
import 'package:qyt_flutter/Views/Widgets/custom_button.dart';
import 'package:qyt_flutter/Views/Widgets/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with StateTools {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextInput(
          name: "loginEmail",
          hintText: "E-Mail",
          type: TextInputType.emailAddress,
        ),
        CustomTextInput(
          name: "loginPassword",
          hintText: "Password",
          minLenght: 8,
          obscureText: true,
        ),
        CustomButton(
          title: "Login",
          onTap: () async {
            var email = ic.getValue("loginEmail");
            var password = ic.getValue("loginPassword");

            if (email.isNullOrEmpty || password.isNullOrEmpty) {
              bottomMessage(context, "Please enter email and password");
            } else {
              ac.login(context, email, password);
            }
          },
        ),
        TextButton(
          onPressed: () {
            ac.changeAuthType(AuthType.resetPassword);
          },
          child: Text(
            "Forgot Password?",
            style: GoogleFonts.quicksand(
              color: primaryColor,
              fontSize: 16,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            ac.changeAuthType(AuthType.register);
          },
          child: Text(
            "Don't have an account? Register",
            style: GoogleFonts.quicksand(
              color: primaryColor,
              fontSize: 16,
            ),
          ),
        ),
      ].seperatedBy(5.h),
    );
  }
}
