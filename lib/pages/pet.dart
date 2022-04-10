import 'package:adotei/custom_colors.dart';
import 'package:flutter/material.dart';

class Pet extends StatelessWidget {
  const Pet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.white,
        iconTheme: const IconThemeData(color: CustomColors.green),
      ),
      backgroundColor: CustomColors.white,
      body: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: CustomColors.background),
      ),
    );
  }
}
