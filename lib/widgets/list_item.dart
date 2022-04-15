import 'package:adotei/custom_colors.dart';
import 'package:adotei/custom_icons.dart';
import 'package:adotei/gender.dart';
import 'package:adotei/animal.dart';
import 'package:adotei/model/animal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListItem extends StatelessWidget {
  ListItem({Key? key, required this.myAnimal}) : super(key: key);
  final MyAnimal myAnimal;

  double borderRadius = 10;

  double boxSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2;
    return width;
  }

  String animals() {
    if (myAnimal.animal == Animal.cat) {
      return CustomIcons.cat;
    } else {
      return CustomIcons.dog;
    }
  }

  String genders() {
    if (myAnimal.gender == Gender.male) {
      return CustomIcons.male;
    } else {
      return CustomIcons.female;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: SizedBox(
        height: boxSize(context),
        child: Container(
          decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  height: boxSize(context),
                  width: boxSize(context),
                  decoration: BoxDecoration(
                    color: CustomColors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(animals()),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        myAnimal.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${myAnimal.age} ano(s)',
                              style: const TextStyle(fontSize: 13),
                            ),
                            SvgPicture.asset(
                              genders(),
                              width: 13,
                            )
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        myAnimal.description,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('/pet', arguments: myAnimal);
                        },
                        child: const Text('Ver mais'),
                        style: ElevatedButton.styleFrom(
                          primary: CustomColors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
