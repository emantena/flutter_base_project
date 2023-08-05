// loading_overlay.dart
import 'package:base_project/app/theme/app_collor.dart';
import 'package:base_project/app/utils/size_config.dart';
import 'package:base_project/app/widget/buttons/default_button_widget.dart';
import 'package:flutter/material.dart';

class LoadingOverlayWidget extends StatefulWidget {
  const LoadingOverlayWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  static LoadingOverlayWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<LoadingOverlayWidgetState>()!;
  }

  @override
  State<LoadingOverlayWidget> createState() => LoadingOverlayWidgetState();
}

class LoadingOverlayWidgetState extends State<LoadingOverlayWidget> {
  bool _isLoading = false;
  bool _hasError = false;
  String _errorMessage = "";
  String _loaderText = "";

  void showLoader({String loaderText = "Carregando..."}) {
    setState(() {
      _loaderText = loaderText;
      _isLoading = true;
    });
  }

  void hideLoader() {
    setState(() {
      _isLoading = false;
    });
  }

  void showError({required String errorMessage}) {
    setState(() {
      _errorMessage = errorMessage;
      _isLoading = false;
      _hasError = true;
    });
  }

  void _hideError() {
    setState(() {
      _hasError = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_isLoading || _hasError)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.black,
            ),
          ),
        if (_isLoading) _loaderCard(),
        if (_hasError) _errorCard(),
      ],
    );
  }

  Widget _loaderCard() {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: getProportionateScreenWidth(180),
            height: getProportionateScreenHeight(100),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      "Por favor aguarde",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: CircularProgressIndicator(
                        color: AppColor.primary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(_loaderText),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _errorCard() {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: getProportionateScreenWidth(220),
            height: getProportionateScreenHeight(150),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      "Ocorreu um erro",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        bottom: 5,
                      ),
                      child: Flexible(
                        child: Text(
                          _errorMessage,
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                defaultButtonWidget(
                  func: () => _hideError(),
                  buttonColor: AppColor.primary,
                  context: context,
                  labelButton: "OK",
                ),
                // FloatingActionButton(
                //   elevation: 0,
                //   backgroundColor: AppColor.primary,
                //   foregroundColor: AppColor.secondary,
                //   onPressed: () => _hideError(),
                //   child: const Text("OK"),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
