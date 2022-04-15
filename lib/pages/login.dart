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
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: const Offset(5, 5),
                  blurRadius: 15,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: ListView(
              padding: const EdgeInsets.all(15),
              shrinkWrap: true,
              children: [
                const Text(
                  'Faça o login para continuar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                buildTextField('Usuario', false),
                buildTextField('Senha', true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {}, child: const Text('Registre-se')),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Esqueci a senha'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Entrar'),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: CustomColors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
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
