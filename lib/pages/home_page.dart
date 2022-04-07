import 'package:adotei/animal.dart';
import 'package:adotei/custom_colors.dart';
import 'package:adotei/custom_icons.dart';
import 'package:adotei/gender.dart';
import 'package:adotei/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: CustomColors.backgroundWhite,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: CustomColors.green,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text(
                    'Josh Godoy',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.backgroundWhite,
                    ),
                  ),
                  Text(
                    'email@email.com.br',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.backgroundWhite,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                'Configurações',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop(const Drawer());
                Navigator.of(context).pushNamed('/add');
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text(
                'Fale conosco',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.question_mark),
              title: const Text(
                'Ajuda',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Sair',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
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
            color: CustomColors.backgroundWhite),
        child: Column(
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
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CustomColors.white,
                      ),
                      child: SvgPicture.asset(
                        CustomIcons.cat,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CustomColors.white,
                      ),
                      child: SvgPicture.asset(
                        CustomIcons.dog,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CustomColors.white,
                      ),
                      child: const Icon(
                        Icons.more_horiz,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: const [
                  ListItem(
                      animal: Animal.cat,
                      name: 'Gatinho',
                      gender: Gender.male,
                      description: 'Gatinho bonitinho, muito fofo... sério',
                      age: 1),
                  ListItem(
                      animal: Animal.dog,
                      name: 'Caramelo',
                      gender: Gender.male,
                      description:
                          'Apesar de ser cachorro ele se dá bem com gatos :)',
                      age: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
