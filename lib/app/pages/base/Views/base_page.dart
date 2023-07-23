import 'package:base_project/app/widget/loader.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/ErrorStateProvider.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/LoadingStateProvider.dart';
import 'package:flutter/material.dart';
import 'LoadingView.dart';

class BasePage {
  final Widget loadingView = loader();
  final ErrorStateProvider errorStateProvider = ErrorStateProvider();
  BaseViewStateDelegate? viewStateDelegate;
}

abstract class BaseViewStateDelegate {
  void onChange();
}

abstract class BaseViewModel {
  void initState({ required LoadingStateProvider loadingState });
  // Exposed Properties
  late LoadingStateProvider loadingStatusState;
}
