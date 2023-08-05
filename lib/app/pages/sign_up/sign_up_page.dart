// ignore_for_file: use_build_context_synchronously

import 'package:base_project/app/pages/sign_up/sign_up_controller.dart';
import 'package:base_project/app/theme/app_collor.dart';
import 'package:base_project/app/utils/size_config.dart';
import 'package:base_project/app/utils/validator.dart';
import 'package:base_project/app/widget/buttons/back_button_widget.dart';
import 'package:base_project/app/widget/buttons/default_button_widget.dart';
import 'package:base_project/app/widget/headers/header_text.dart';
import 'package:base_project/app/widget/loading_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = SignUpController();

  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return backButtonWidget(
              context: context,
              color: Colors.black,
            );
          },
        ),
      ),
      body: LoadingOverlayWidget(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    child: headerText(
                      text: "Crie sua conta",
                      color: AppColor.primary,
                      fontSize: 28,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _inputName(),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          _inputEmail(),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          _inputPassword(),
                        ],
                      ),
                    ),
                  ),
                  defaultButtonWidget(
                    context: context,
                    func: () async {
                      final isValid =
                          _formKey.currentState?.validate() ?? false;

                      if (!isValid) {
                        return;
                      }

                      _formKey.currentState?.save();

                      LoadingOverlayWidget.of(context).showLoader();

                      final result = await _controller.createUser(
                        email: _emailController.text,
                        name: _nameController.text,
                        password: _passwordController.text,
                      );

                      if (_controller.hasError) {
                        LoadingOverlayWidget.of(context).showError(
                          errorMessage: _controller.errorMessage,
                        );
                        return;
                      }

                      LoadingOverlayWidget.of(context).hideLoader();
                      Modular.to.popAndPushNamed("/sing-in");
                    },
                    labelButton: "Salvar",
                    buttonColor: AppColor.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _inputName() {
    return TextFormField(
      controller: _nameController,
      validator: (value) {
        final name = value ?? '';

        if (name.isEmpty) {
          return 'informe o nome!';
        }

        return null;
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        fillColor: AppColor.inputBackGround,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: "nome",
        suffixIcon: const Icon(
          Icons.person_2_outlined,
        ),
      ),
    );
  }

  TextFormField _inputEmail() {
    return TextFormField(
      controller: _emailController,
      validator: (value) {
        final email = value ?? '';

        if (email.isEmpty) {
          return 'informe o email!';
        }

        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        fillColor: AppColor.inputBackGround,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: "email",
        suffixIcon: const Icon(
          Icons.mail_outline,
        ),
      ),
    );
  }

  TextFormField _inputPassword() {
    return TextFormField(
      controller: _passwordController,
      validator: (value) {
        final password = value ?? '';

        if (password.isEmpty) {
          return 'informe a senha!';
        }

        return null;
      },
      obscureText: !_showPassword,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        fillColor: AppColor.inputBackGround,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: "senha",
        suffixIcon: IconButton(
          icon: _showPassword
              ? const Icon(Icons.visibility_outlined)
              : const Icon(Icons.visibility_off_outlined),
          onPressed: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        ),
      ),
    );
  }
}
