import 'package:base_project/app/pages/sign_up/sign_up_controller.dart';
import 'package:base_project/app/theme/app_collor.dart';
import 'package:base_project/app/utils/size_config.dart';
import 'package:base_project/app/utils/validator.dart';
import 'package:base_project/app/widget/buttons/back_button_widget.dart';
import 'package:base_project/app/widget/buttons/createButton.dart';
import 'package:base_project/app/widget/headers/header_text.dart';
import 'package:base_project/app/widget/loader.dart';
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
  bool _isLoading = false;

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
      body: SingleChildScrollView(
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _inputName(),
                      _inputEmail(),
                      _inputPassword(),
                    ],
                  ),
                ),
                !_controller.hasError
                    ? SizedBox(
                        height: getProportionateScreenHeight(20),
                      )
                    : const Text("Não foi possível criar um novo usuario"),
                _isLoading
                    ? loader(text: "Salvando")
                    : createButton(
                        context: context,
                        func: () async {
                          final isValid =
                              _formKey.currentState?.validate() ?? false;

                          if (!isValid) {
                            return;
                          }

                          _formKey.currentState?.save();

                          setState(() {
                            _isLoading = true;
                          });

                          final result = await _controller.createUser(
                            email: _emailController.text,
                            name: _nameController.text,
                            password: _passwordController.text,
                          );

                          setState(() {
                            _isLoading = false;
                          });

                          if (result) {
                            Modular.to.popAndPushNamed("/sing-in");
                          }
                        },
                        labelButton: "Salvar",
                        buttonColor: AppColor.primary,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _inputName() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 20),
      width: getProportionateScreenWidth(350),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.inputBackGround,
      ),
      child: TextFormField(
        controller: _nameController,
        validator: (value) {
          final name = value ?? '';

          if (name.isEmpty) {
            return 'informe o nome!';
          }

          return null;
        },
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: "nome",
          suffixIcon: Icon(
            Icons.person_2_outlined,
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

          if (!Validator.isValidEmail(email)) {
            return "email inválido";
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
