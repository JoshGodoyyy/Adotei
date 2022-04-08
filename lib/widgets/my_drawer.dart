import 'package:flutter/material.dart';

import '../custom_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.white,
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
                    color: CustomColors.background,
                  ),
                ),
                Text(
                  'email@email.com.br',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.background,
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
            child: Divider(
              color: Colors.black,
            ),
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
    );
  }
}
