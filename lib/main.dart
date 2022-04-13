import 'package:adotei/model/animal.dart';
import 'package:adotei/pages/about.dart';
import 'package:adotei/pages/add_pet.dart';
import 'package:adotei/pages/home_page.dart';
import 'package:adotei/pages/login.dart';
import 'package:adotei/pages/pet.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const HomePage());
          case '/add':
            return MaterialPageRoute(builder: (context) => const AddPet());
          case '/pet':
            return MaterialPageRoute(
                builder: (context) => Pet(setting.arguments as MyAnimal));
          case '/about':
            return MaterialPageRoute(builder: (context) => const About());
          default:
            return MaterialPageRoute(builder: (context) => const LoginPage());
        }
      },
    );
  }
}
