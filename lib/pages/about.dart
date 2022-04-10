import 'package:adotei/custom_colors.dart';
import 'package:adotei/custom_icons.dart';
import 'package:adotei/widgets/list_about.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: CustomColors.green),
        backgroundColor: CustomColors.white,
        title: const Text(
          'Sobre',
          style: TextStyle(color: CustomColors.green),
        ),
        centerTitle: true,
      ),
      backgroundColor: CustomColors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: CustomColors.background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: ListView(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Icones',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  ItemAbout(
                    icon: CustomIcons.cat,
                    title: 'Cat',
                    subtitle: 'https://www.svgrepo.com/svg/99298/cat',
                  ),
                  ItemAbout(
                    icon: CustomIcons.dog,
                    title: 'Dog',
                    subtitle: 'https://www.svgrepo.com/svg/145707/dog',
                  ),
                  ItemAbout(
                    icon: CustomIcons.male,
                    title: 'Male Icon',
                    subtitle: 'https://www.flaticon.com/free-icons/male',
                  ),
                  ItemAbout(
                    icon: CustomIcons.female,
                    title: 'Female Icon',
                    subtitle: 'https://www.flaticon.com/free-icons/female',
                  ),
                  ItemAbout(
                    icon: CustomIcons.pawprint,
                    title: 'Pawprint',
                    subtitle: 'https://www.flaticon.com/free-icons/paw',
                  ),
                  ItemAbout(
                    icon: CustomIcons.pin,
                    title: 'Pin',
                    subtitle: 'https://www.flaticon.com/free-icons/pin',
                  ),
                ],
              ),
            ),
            const Text('App desenvolvido em Flutter. Feito com <3')
          ],
        ),
      ),
    );
  }
}
