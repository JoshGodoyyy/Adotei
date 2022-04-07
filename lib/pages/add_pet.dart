import 'package:adotei/custom_colors.dart';
import 'package:flutter/material.dart';

class AddPet extends StatelessWidget {
  const AddPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.white,
        iconTheme: const IconThemeData(color: CustomColors.green),
        title: const Text(
          'Cadastro',
          style: TextStyle(
            color: CustomColors.green,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: CustomColors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: CustomColors.backgroundWhite,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
