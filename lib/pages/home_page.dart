import 'package:adotei/app_controller.dart';
import 'package:adotei/custom_colors.dart';
import 'package:adotei/custom_icons.dart';
import 'package:adotei/model/animal.dart';
import 'package:adotei/widgets/button_filter.dart';
import 'package:adotei/widgets/list_item.dart';
import 'package:adotei/widgets/my_drawer.dart';
import 'package:adotei/widgets/pet_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  List<MyAnimal> animals = [];
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bool _isCatActive = false;
  final bool _isDogActive = false;
  final bool _isAllActive = true;

  final bool _male = false;
  final bool _female = false;

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
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/add'),
            icon: SvgPicture.asset(
              CustomIcons.pawprint,
              color: CustomColors.green,
              width: 20,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.animals = AppController.getInstance.animal;
              });
            },
            icon: const Icon(Icons.refresh),
          ),
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
              padding: EdgeInsets.all(20),
              child: Text(
                'Estou procurando por:',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PetButton(
                  _isCatActive,
                  title: 'Gato',
                  icon: CustomIcons.cat,
                ),
                PetButton(
                  _isDogActive,
                  title: 'Cachorro',
                  icon: CustomIcons.dog,
                ),
                PetButton(
                  _isAllActive,
                  title: 'Todos',
                  icon: CustomIcons.pawprint,
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Filtros',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FilterButton(_male, title: 'Macho'),
                      FilterButton(_female, title: 'Fêmea'),
                    ],
                  )
                ],
              ),
            ),
            Flexible(
              child: ListView(
                children: [
                  for (MyAnimal i in AppController.getInstance.animal)
                    ListItem(myAnimal: i),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
