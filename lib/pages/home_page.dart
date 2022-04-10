import 'package:adotei/animal.dart';
import 'package:adotei/custom_colors.dart';
import 'package:adotei/custom_icons.dart';
import 'package:adotei/gender.dart';
import 'package:adotei/widgets/list_item.dart';
import 'package:adotei/widgets/my_drawer.dart';
import 'package:adotei/widgets/pet_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCatSelected = false;
  bool isDogSelected = false;
  bool fishballcat = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.green),
        backgroundColor: CustomColors.white,
        elevation: 0,
        title: Column(
          children: [
            Text(
              'Local',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  CustomIcons.pin,
                  width: 20,
                  color: CustomColors.green,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'São Paulo',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset(
              CustomIcons.pawprint,
              color: CustomColors.green,
              width: 20,
            ),
          )
        ],
      ),
      backgroundColor: CustomColors.white,
      body: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: CustomColors.background),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  prefixIcon: Icon(Icons.search),
                  suffixIconColor: CustomColors.green,
                  hintText: 'Procurar',
                  fillColor: CustomColors.white,
                  filled: true,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              child: Text(
                'Estou procurando por:',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                PetButton(
                  title: 'Gato',
                  icon: CustomIcons.cat,
                ),
                PetButton(
                  title: 'Cachorro',
                  icon: CustomIcons.dog,
                ),
                PetButton(
                  title: 'Todos',
                  icon: CustomIcons.pawprint,
                ),
              ],
            ),
            Flexible(
              child: ListView(
                //padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  ListItem(
                    animal: Animal.cat,
                    name: 'Louie',
                    age: 1,
                    gender: Gender.male,
                    description:
                        'Descrição do bichano, seu temperamento é daora... gato top esse, até declara imposto de renda :)',
                  ),
                  ListItem(
                    animal: Animal.dog,
                    name: 'Aslam',
                    age: 2,
                    gender: Gender.male,
                    description:
                        'Cachorro e é isso, ao contrário do gato, ele sabe sonegar impostos e é isso... To sem criatividade',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
