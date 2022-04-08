import 'package:adotei/custom_colors.dart';
import 'package:adotei/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  double borderRadius = 10;

  double boxSize() {
    double width = MediaQuery.of(context).size.width / 2;
    return width;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: SizedBox(
        height: boxSize(),
        child: Container(
          decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  height: boxSize(),
                  width: boxSize(),
                  decoration: BoxDecoration(
                    color: CustomColors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius),
                    ),
                  ),
                  child: SvgPicture.asset(CustomIcons.cat),
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
                        'Nome',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '10 anos',
                            style: TextStyle(fontSize: 13),
                          ),
                          SvgPicture.asset(
                            CustomIcons.male,
                            width: 13,
                          )
                        ],
                      ),
                      Expanded(child: Container()),
                      Text(
                        'Aqui vai a descrição do animal, escreva algo simples e objetivo, como seu temperamento',
                        style: TextStyle(
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
