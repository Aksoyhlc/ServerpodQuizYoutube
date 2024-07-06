import 'package:flutter/material.dart';

extension BuildContextExtenison on BuildContext {
  to(Widget page, {String? name}) {
    Navigator.push(
      this,
      materialPageRoute(page, name),
    );
  }

  toRemove(Widget page, {String? name}) {
    Navigator.pushAndRemoveUntil(
      this,
      materialPageRoute(page, name),
      (route) => false,
    );
  }

  toReplace(Widget page, {String? name}) {
    Navigator.pushReplacement(
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