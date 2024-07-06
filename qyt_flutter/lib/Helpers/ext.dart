import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qyt_flutter/Const/const.dart';
import 'package:qyt_flutter/Controllers/State/auth_controller.dart';
import 'package:qyt_flutter/Controllers/State/global_controller.dart';
import 'package:qyt_flutter/Controllers/State/input_controller.dart';

controllerInjection() {
  if (!Get.isRegistered<InputController>()) {
    Get.put(InputController());
  }

  if (!Get.isRegistered<GlobalController>()) {
    Get.put(GlobalController());
  }

  if (!Get.isRegistered<AuthController>()) {
    Get.put(AuthController());
  }
}

bottomMessage(BuildContext context, String? content,
    {String? title, MessageType type = MessageType.error}) {
  Color color = Colors.red;

  if (type == MessageType.success) {
    color = Colors.green;
  } else if (type == MessageType.warning) {
    color = Colors.yellow;
  } else if (type == MessageType.info) {
    color = Colors.blue;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Column(
        children: [
          if (title != null)
            Text(
              title,
              style: GoogleFonts.playfairDisplay(
                color: whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (content != null)
            Text(
              content,
              style: GoogleFonts.playfairDisplay(
                color: whiteColor,
                fontSize: 18,
              ),
            ),
        ],
      ),
    ),
  );
}
