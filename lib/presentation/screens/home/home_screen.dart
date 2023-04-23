import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets en flutter'),
      ),
      body: SafeArea(child: _HomeView()),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        return _CustomListTile(
          menuItem: appMenuItems[index],
        );
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItem menuItem;
  const _CustomListTile({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      leading: Icon(
        menuItem.icon,
        color: colors.primary,
      ),
      trailing: Icon(Icons.arrow_forward_ios_outlined),
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (_) => const ButtonsScreen()));

        // Navigator.pushNamed(context, menuItem.link);
        context.push(menuItem.link); //Solo funciona con Go_router
        // context.pushNamed(CardsScreen.name);//Para llamar por nombre de la ruta
      },
    );
  }
}
