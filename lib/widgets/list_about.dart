import 'package:adotei/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemAbout extends StatelessWidget {
  const ItemAbout(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle})
      : super(key: key);
  final String icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      child: Material(
        color: CustomColors.background,
        child: InkWell(
          onTap: () {},
          splashColor: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  width: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
