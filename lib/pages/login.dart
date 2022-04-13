import 'package:adotei/custom_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.green,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(flex: 1, child: Container()),
          Flexible(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: CustomColors.background,
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTextField('Usuário', false),
                    buildTextField('Senha', true),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                        child: const Text('Entrar'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(14),
                          primary: CustomColors.blue,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String hint, bool obscure) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          fillColor: CustomColors.white,
          filled: true,
        ),
      ),
    );
  }
}
