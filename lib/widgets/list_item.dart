import 'package:adotei/custom_icons.dart';
import 'package:adotei/gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../animal.dart';
import '../custom_colors.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.animal,
    required this.name,
    required this.gender,
    required this.description,
    required this.age,
  }) : super(key: key);

  final Animal animal;
  final String name;
  final Gender gender;
  final String description;
  final int age;

  String animals() {
    if (animal == Animal.dog) {
      return CustomIcons.dog;
    } else {
      return CustomIcons.cat;
    }
  }

  String genders() {
    if (gender == Gender.male) {
      return CustomIcons.male;
    } else {
      return CustomIcons.female;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColors.green,
            ),
            child: SvgPicture.asset(
              animals(),
              color: Colors.white,
            ),
          ),
          Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: CustomColors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '$age ano(s)',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 12,
                        ),
                      ),
                      SvgPicture.asset(
                        genders(),
                        color: Colors.grey,
                        width: 12,
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
