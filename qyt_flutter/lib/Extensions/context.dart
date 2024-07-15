import 'package:flutter/material.dart';

extension BuildContextExtenison on BuildContext {
  Future<dynamic> to(Widget page, {String? name}) async {
    await Navigator.push(
      this,
      materialPageRoute(page, name),
    );
  }

  Future<dynamic> toRemove(Widget page, {String? name}) async {
    await Navigator.pushAndRemoveUntil(
      this,
      materialPageRoute(page, name),
      (route) => false,
    );
  }

  toReplace(Widget page, {String? name}) async {
    await Navigator.pushReplacement(
      this,
      materialPageRoute(page, name),
    );
  }

  back() {
    Navigator.pop(this);
  }

  MaterialPageRoute<dynamic> materialPageRoute(Widget page, String? name) {
    return MaterialPageRoute(
      builder: (context) => page,
      settings: RouteSettings(
        name: name,
      ),
    );
  }
}
