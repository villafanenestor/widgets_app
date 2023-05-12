import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';



class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top >35; //Saber el padnig que hay en top, es para verificar si hay notch
     
    return NavigationDrawer(
      onDestinationSelected: (value){ //Para cambiar la opcion del menu
        setState(() {
          navDrawerIndex = value;
   
        });
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();//para cerrar Drawer o menu lateral
        

      },
      selectedIndex: navDrawerIndex,
      children: [
      Padding( padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),//Si tiene noch no se agrega nada, si no tine entonces se agreag una separacion
      child: Text('Opciones Principales')),
      ...appMenuItems
      .sublist(0,3)
      .map((itemMenu) => //Se barre todos los items del menuff
      NavigationDrawerDestination(icon: Icon(itemMenu.icon), label: Text(itemMenu.title)),
      ),
      const Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: 28, vertical: 10),
      child: Divider(),
      ),
      const Padding(padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10), child: Text('Mas Opciones'),),
      ...appMenuItems
      .sublist(3)
      .map((itemMenu) => 
      NavigationDrawerDestination(icon: Icon(itemMenu.icon), label: Text(itemMenu.title),),),
      
    ],);
  }
}