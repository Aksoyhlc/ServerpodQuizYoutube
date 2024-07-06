import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputController extends GetxController {
  final RxMap<String, TextEditingController> _dataController =
      <String, TextEditingController>{}.obs;

  void dataControllerChange(String key, TextEditingController value) {
    _dataController[key] = value;
  }

  TextEditingController? getController(String key,
      {bool createIfNull = true, String? defaultValue}) {
    if (_dataController[key] == null && createIfNull) {
      _dataController[key] = TextEditingController(text: defaultValue);
    } else if (_dataController[key] != null && defaultValue != null) {
      _dataController[key]!.text = defaultValue;
    }

    return _dataController[key];
  }

  String getValue(String key) {
    return _dataController[key]?.text ?? "";
  }

  void setValue(String key, String value) {
    var controller = getController(key, defaultValue: value);
    controller!.text = value;
  }

  void clearController() {
    _dataController.forEach((key, value) {
      value.dispose();
    });
    _dataController.clear();
  }

  void clearAll() {
    clearController();
  }

  void clearValue(String key) {
    _dataController[key]?.clear();
  }

  void clearAllValue() {
    clearController();
  }

  void removeDataController(String key) {
    _dataController.remove(key);
  }
}
