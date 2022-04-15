import 'package:adotei/custom_colors.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  FilterButton(this.isActive, {Key? key, required this.title})
      : super(key: key);
  final String title;
  bool isActive = true;

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.isActive != widget.isActive;
          });
          print(widget.title);
        },
        child: Container(
          decoration: BoxDecoration(
            color:
                widget.isActive ? CustomColors.brown : CustomColors.darkBrown,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: CustomColors.background,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
