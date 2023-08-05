import 'package:flutter/material.dart';

class BaseController extends ChangeNotifier {
  late bool isLoading = false;
  late bool hasData = false;
  late bool hasError = false;
  late String errorMessage = "";

  void update(
      {bool isLoading = false,
      bool hasData = false,
      bool hasError = false,
      String errorMessage = ""}) {
    this.isLoading = isLoading;
    this.hasData = hasData;
    this.hasError = hasError;
    this.errorMessage = errorMessage;

    notifyListeners();
  }
}
