import 'package:get/get.dart';
import 'package:qyt_flutter/Controllers/State/auth_controller.dart';
import 'package:qyt_flutter/Controllers/State/global_controller.dart';
import 'package:qyt_flutter/Controllers/State/input_controller.dart';

mixin StateTools {
  final ic = Get.find<InputController>();
  final ac = Get.find<AuthController>();
  final gc = Get.find<GlobalController>();
}
