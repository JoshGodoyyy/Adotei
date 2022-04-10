import 'package:adotei/custom_colors.dart';
import 'package:adotei/custom_icons.dart';
import 'package:adotei/gender.dart';
import 'package:adotei/animal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListItem extends StatefulWidget {
  ListItem(
      {Key? key,
      required this.animal,
      required this.name,
      required this.age,
      required this.gender,
      required this.description})
      : super(key: key);
  final Animal animal;
  final String name;
  final int age;
  final Gender gender;
  final String description;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  double borderRadius = 10;

  double boxSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2;
    return width;
  }

  String animals() {
    if (widget.animal == Animal.cat) {
      return CustomIcons.cat;
    } else {
      return CustomIcons.dog;
    }
  }

  String genders() {
    if (widget.gender == Gender.male) {
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
                offset: Offset(0, 3),
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
                    child: SvgPicture.asset(CustomIcons.pawprint),
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
                        widget.name,
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
                              '${widget.age} ano(s)',
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
                        widget.description,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
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
