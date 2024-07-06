import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qyt_client/qyt_client.dart';
import 'package:qyt_flutter/Const/const.dart';
import 'package:qyt_flutter/Extensions/context.dart';
import 'package:qyt_flutter/Extensions/list.dart';
import 'package:qyt_flutter/Extensions/num.dart';
import 'package:qyt_flutter/Extensions/string.dart';
import 'package:qyt_flutter/Helpers/ext.dart';
import 'package:qyt_flutter/Mixins/state_tools.dart';
import 'package:qyt_flutter/Views/Widgets/custom_button.dart';
import 'package:qyt_flutter/Views/Widgets/custom_text_field.dart';

class RegisterValidationForm extends StatefulWidget {
  const RegisterValidationForm({super.key});

  @override
  State<RegisterValidationForm> createState() => _RegisterValidationFormState();
}

class _RegisterValidationFormState extends State<RegisterValidationForm>
    with StateTools {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextInput(
          name: "regValidateCode",
          hintText: "Validation Code",
          required: true,
        ),
        CustomButton(
          title: "Send",
          onTap: () async {
            var code = ic.getValue("regValidateCode");
            if (code.isNullOrEmpty) {
              bottomMessage(context, "Please enter validation code");
            } else {
              var user = await ac.emailAuthController
                  .validateAccount(ic.getValue("registerEmail"), code);

              if (user == null) {
                bottomMessage(context, "Invalid validation code");
                return;
              }

              var login = await ac.login(
                context,
                ic.getValue("registerEmail"),
                ic.getValue("registerPassword"),
                redirect: false,
              );

              if (!login) {
                bottomMessage(context, "Something went wrong");
                return;
              }

              bool userInfoUpdate = await gc.client.user.userInfoUpdate(
                User(
                  name: ic.getValue("registerName"),
                  userInfoId: user.id!,
                  userInfo: user,
                ),
              );

              if (!userInfoUpdate) {
                bottomMessage(context, "Something went wrong");
                return;
              }

              bottomMessage(context, "Account validated successfully",
                  type: MessageType.success);

              context.toRemove(Text("aaaa"));
            }
          },
        ),
        TextButton(
          onPressed: () {
            ac.changeAuthType(AuthType.register);
          },
          child: Text(
            "Register",
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
