import 'package:adotei/animal.dart';
import 'package:adotei/custom_colors.dart';
import 'package:adotei/custom_icons.dart';
import 'package:adotei/gender.dart';
import 'package:adotei/model/animal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Pet extends StatelessWidget {
  const Pet(
    this.myAnimal, {
    Key? key,
  }) : super(key: key);

  final MyAnimal myAnimal;

  String icon() {
    if (myAnimal.animal == Animal.dog) {
      return CustomIcons.dog;
    } else {
      return CustomIcons.cat;
    }
  }

  String gender() {
    if (myAnimal.gender == Gender.male) {
      return 'Macho';
    } else {
      return 'Fêmea';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.green,
        iconTheme: const IconThemeData(color: CustomColors.white),
        title: Text(myAnimal.name),
        centerTitle: true,
      ),
      backgroundColor: CustomColors.green,
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: SvgPicture.asset(icon()),
          ),
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
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 80),
                child: ListView(
                  children: [
                    Text(
                      'Olá, meu nome é ${myAnimal.name}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Tenho ${myAnimal.age} anos, sou ${gender()}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      myAnimal.description,
                      style: const TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            color: CustomColors.white,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Sobre'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.app_registration), label: 'Contato'),
            ],
          ),
        ),
      ),
    );
  }
}
