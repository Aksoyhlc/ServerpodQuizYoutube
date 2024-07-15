import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qyt_flutter/Const/const.dart';
import 'package:qyt_flutter/Controllers/State/global_controller.dart';
import 'package:qyt_flutter/Extensions/context.dart';
import 'package:qyt_flutter/Helpers/ext.dart';
import 'package:qyt_flutter/Views/Admin/Home/home.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class AuthController extends GetxController {
  final gc = Get.find<GlobalController>();
  late SessionManager sessionManager;

  bool get isLogin => sessionManager.isSignedIn;
  bool get isAdmin =>
      sessionManager.signedInUser?.scopeNames.contains("serverpod.admin") ??
      false;

  UserInfo? get userInfo => sessionManager.signedInUser;

  late EmailAuthController emailAuthController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sessionManager = SessionManager(
      caller: gc.client.modules.auth,
    );
    emailAuthController = EmailAuthController(gc.client.modules.auth);

    sessionManager.initialize().then(
      (value) {
        sessionManager.addListener(
          () {
            print("OTURUM DEĞİŞTİ");
          },
        );
      },
    );
  }

  Rx<AuthType> authType = AuthType.login.obs;

  changeAuthType(AuthType type) {
    authType.value = type;
  }

  Future<bool> login(
    BuildContext context,
    String email,
    String password, {
    bool redirect = true,
  }) async {
    var result = await emailAuthController.signIn(email, password);
    if (result == null) {
      bottomMessage(context, "Invalid email or password");
      return false;
    }

    if (redirect) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          Widget page = AdminHomePage();
          context.toRemove(page);
        },
      );
    }

    return true;
  }
}
