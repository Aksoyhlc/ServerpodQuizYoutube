import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qyt_flutter/Const/const.dart';
import 'package:qyt_flutter/Extensions/list.dart';
import 'package:qyt_flutter/Extensions/num.dart';
import 'package:qyt_flutter/Helpers/ext.dart';
import 'package:qyt_flutter/Mixins/state_tools.dart';
import 'package:qyt_flutter/Views/Widgets/custom_button.dart';
import 'package:qyt_flutter/Views/Widgets/custom_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> with StateTools {
  bool second = false;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!second)
            CustomTextInput(
              name: "rpEmail",
              hintText: "E-Mail",
              type: TextInputType.emailAddress,
              required: true,
            ),
          if (second)
            CustomTextInput(
              name: "rpCode",
              hintText: "Code",
              required: true,
            ),
          if (second)
            CustomTextInput(
              name: "rpPassword",
              hintText: "Password",
              minLenght: 8,
              required: true,
              obscureText: true,
            ),
          if (second)
            CustomTextInput(
              name: "rpRePassword",
              hintText: "Confirm Password",
              minLenght: 8,
              required: true,
              obscureText: true,
            ),
          CustomButton(
            title: "Reset Password",
            onTap: () async {
              if (formKey.currentState!.validate()) {
                if (!second) {
                  bool result = await ac.emailAuthController
                      .initiatePasswordReset(ic.getValue("rpEmail"));
                  formKey = GlobalKey<FormState>();
                  if (result) {
                    setState(() {
                      second = true;
                    });
                  } else {
                    bottomMessage(context, "Something went wrong");
                  }

                  return;
                }

                if (ic.getValue("rpPassword") != ic.getValue("rpRePassword")) {
                  bottomMessage(context, "Passwords do not match");
                  return;
                }

                print([
                  ic.getValue("rpEmail"),
                  ic.getValue("rpCode"),
                  ic.getValue("rpPassword"),
                ]);

                bool result = await ac.emailAuthController.resetPassword(
                  ic.getValue("rpEmail"),
                  ic.getValue("rpCode"),
                  ic.getValue("rpPassword"),
                );

                if (!result) {
                  bottomMessage(context, "Verification code is incorrect");
                  return;
                }

                bottomMessage(context, "Password reset successfully",
                    type: MessageType.success);
                ac.login(
                    context, ic.getValue("rpEmail"), ic.getValue("rpPassword"));
                return;
              }
            },
          ),
          TextButton(
            onPressed: () {
              ac.changeAuthType(AuthType.login);
            },
            child: Text(
              "Remembered Password? Login",
              style: GoogleFonts.quicksand(
                color: primaryColor,
                fontSize: 16,
              ),
            ),
          ),
        ].seperatedBy(5.h),
      ),
    );
  }
}
