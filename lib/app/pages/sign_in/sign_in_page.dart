// ignore_for_file: use_build_context_synchronously

import 'package:base_project/app/pages/sign_in/sign_in_controller.dart';
import 'package:base_project/app/theme/app_collor.dart';
import 'package:base_project/app/utils/size_config.dart';
import 'package:base_project/app/widget/buttons/default_button_widget.dart';
import 'package:base_project/app/widget/headers/header_text.dart';
import 'package:base_project/app/widget/loading_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = SignInController();

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: getProportionateScreenHeight(470),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      children: [
                        headerText(
                          text: "Bem vindo de volta",
                          color: AppColor.primary,
                          fontSize: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            "Faça login na sua conta",
                            style: TextStyle(
                              color: Theme.of(context).disabledColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _inputEmail(),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              _inputPassword(),
                            ],
                          ),
                        ),
                        !_controller.hasError
                            ? SizedBox(
                                height: getProportionateScreenHeight(20),
                              )
                            : const Text("Login ou senha inválidos"),
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

                            final result = await _controller.login(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );

                            LoadingOverlayWidget.of(context).hideLoader();
                          },
                          labelButton: "Login",
                          buttonColor: AppColor.primary,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "forgot-password");
                            },
                            child: Text(
                              "Esqueci minha senha",
                              style: TextStyle(
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Não tem uma conta?",
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontSize: 15,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Modular.to.pushNamed("/sign-up");
                                },
                                child: Text(
                                  " Cadastre-se",
                                  style: TextStyle(
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
