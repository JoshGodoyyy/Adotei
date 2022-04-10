import 'package:adotei/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PetButton extends StatelessWidget {
  const PetButton({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final String icon;

  double boxSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 6;
    return width;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: boxSize(context),
        height: boxSize(context) * 1.3,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: CustomColors.darkBrown,
        ),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: CustomColors.brown,
                  ),
                  child: SvgPicture.asset(
                    icon,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                title,
                style: const TextStyle(
                  color: CustomColors.background,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
