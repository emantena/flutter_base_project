import 'package:base_project/app/pages/sign_in/sign_in_controller.dart';
import 'package:base_project/app/theme/app_collor.dart';
import 'package:base_project/app/utils/size_config.dart';
import 'package:base_project/app/widget/buttons/createButton.dart';
import 'package:base_project/app/widget/headers/header_text.dart';
import 'package:base_project/app/widget/loader.dart';
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
  bool _isLoading = false;

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
                        Text(
                          "Faça login na sua conta",
                          style: TextStyle(
                            color: Theme.of(context).disabledColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _inputEmail(),
                              _inputPassword(),
                            ],
                          ),
                        ),
                        !_controller.hasError
                            ? SizedBox(
                                height: getProportionateScreenHeight(20),
                              )
                            : const Text("Login ou senha inválidos"),
                        _isLoading
                            ? loader()
                            : createButton(
                                context: context,
                                func: () async {
                                  final isValid =
                                      _formKey.currentState?.validate() ??
                                          false;

                                  if (!isValid) {
                                    return;
                                  }

                                  _formKey.currentState?.save();

                                  setState(() {
                                    _isLoading = true;
                                  });

                                  final result = await _controller.login(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );

                                  setState(() {
                                    _isLoading = false;
                                  });

                                  // if (result) {
                                  //   Modular.to.popAndPushNamed("/sing-in");
                                  // }
                                },
                                labelButton: "Salvar",
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

  Container _inputEmail() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 20),
      width: getProportionateScreenWidth(350),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.inputBackGround,
      ),
      child: TextFormField(
        controller: _emailController,
        validator: (value) {
          final email = value ?? '';

          if (email.isEmpty) {
            return 'informe o email!';
          }

          return null;
        },
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: "email",
          suffixIcon: Icon(
            Icons.mail_outline,
          ),
        ),
      ),
    );
  }

  Container _inputPassword() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 20),
      width: getProportionateScreenWidth(350),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.inputBackGround,
      ),
      child: TextFormField(
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
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
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
      ),
    );
  }
}
