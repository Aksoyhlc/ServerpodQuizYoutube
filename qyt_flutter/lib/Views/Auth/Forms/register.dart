import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qyt_flutter/Const/const.dart';
import 'package:qyt_flutter/Extensions/list.dart';
import 'package:qyt_flutter/Extensions/num.dart';
import 'package:qyt_flutter/Helpers/ext.dart';
import 'package:qyt_flutter/Mixins/state_tools.dart';
import 'package:qyt_flutter/Views/Widgets/custom_button.dart';
import 'package:qyt_flutter/Views/Widgets/custom_text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> with StateTools {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextInput(
              name: "registerName",
              hintText: "Name",
              required: true,
            ),
            CustomTextInput(
              name: "registerUserName",
              hintText: "Username",
              required: true,
            ),
            CustomTextInput(
              name: "registerEmail",
              hintText: "E-Mail",
              type: TextInputType.emailAddress,
              required: true,
            ),
            CustomTextInput(
              name: "registerPassword",
              hintText: "Password",
              minLenght: 8,
              obscureText: true,
              required: true,
            ),
            CustomButton(
              title: "Register",
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  var result =
                      await ac.emailAuthController.createAccountRequest(
                    ic.getValue("registerUserName"),
                    ic.getValue("registerEmail"),
                    ic.getValue("registerPassword"),
                  );

                  if (result) {
                    ac.changeAuthType(AuthType.emailValidation);
                  } else {
                    bottomMessage(context, "Something went wrong");
                  }
                }
              },
            ),
            TextButton(
              onPressed: () {
                ac.changeAuthType(AuthType.login);
              },
              child: Text(
                "Already have an account? Login",
                style: GoogleFonts.quicksand(
                  color: primaryColor,
                  fontSize: 16,
                ),
              ),
            ),
          ].seperatedBy(5.h),
        ),
      ),
    );
  }
}
