import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(title: 'Botones', subTitle: 'varios botones en flutter', link: '/buttons', icon: Icons.smart_button_outlined),
  MenuItem(title: 'Tarjestas', subTitle: 'Un contenedor estilizado', link: '/cards', icon: Icons.credit_card),
];
