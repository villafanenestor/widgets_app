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
  MenuItem(
      title: 'Botones',
      subTitle: 'varios botones en flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjestas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicators',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_outlined),
  MenuItem(
      title: 'Snackbars Dialogs',
      subTitle: 'Generales y controlados',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animated Containers',
      subTitle: 'Animated Containers',
      link: '/animated',
      icon: Icons.gif_box_rounded),
  MenuItem(
      title: 'UI CONTROLS',
      subTitle: 'Opciones para UI',
      link: '/ui-controls',
      icon: Icons.gif_box_rounded),
  MenuItem(
      title: 'Tutorial',
      subTitle: 'Opciones para UI',
      link: '/tutorial',
      icon: Icons.accessibility_new_rounded),
  MenuItem(
      title: 'infinity Scroll & pull refresh',
      subTitle: 'Manejo de Infinite Scroll y pull refresh',
      link: '/infinite',
      icon: Icons.accessibility_new_rounded),
  MenuItem(
      title: 'Counter Screen',
      subTitle: 'Counter Screen con Riverpool',
      link: '/counter',
      icon: Icons.accessibility_new_rounded),
];
