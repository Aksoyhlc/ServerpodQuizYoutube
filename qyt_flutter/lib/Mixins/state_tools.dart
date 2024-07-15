import 'package:async/async.dart';
import 'package:get/get.dart';
import 'package:qyt_flutter/Controllers/State/auth_controller.dart';
import 'package:qyt_flutter/Controllers/State/drawer_controller.dart';
import 'package:qyt_flutter/Controllers/State/global_controller.dart';
import 'package:qyt_flutter/Controllers/State/input_controller.dart';

mixin StateTools {
  final ic = Get.find<InputController>();
  final ac = Get.find<AuthController>();
  final gc = Get.find<GlobalController>();
  final dc = Get.find<CustomDrawerController>();

  final memoizer = AsyncMemoizer();

  run(Function() action) async {
    return await memoizer.runOnce(
      () async {
        return await action();
      },
    );
  }
}
