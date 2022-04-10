import 'package:adotei/pages/about.dart';
import 'package:adotei/pages/add_pet.dart';
import 'package:adotei/pages/home_page.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/add': (context) => const AddPet(),
        '/pet': (context) => const Pet(),
        '/about': (context) => const About(),
      },
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case '/add':
            return MaterialPageRoute(builder: (context) => const AddPet());
          case '/pet':
            return MaterialPageRoute(builder: (context) => const Pet());
          default:
            return MaterialPageRoute(builder: (context) => const HomePage());
        }
      },
    );
  }
}
