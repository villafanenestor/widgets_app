import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .clearSnackBars(); //Limpia cualquier snackbar en espera. mas bien detiene clauquiera que se este ejecutando.
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1), //para que se oculte automaticamente
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar Screen'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton.tonal(
              onPressed: () => 
              showAboutDialog(context: context, 
              children: [Text('A continuacion se pueden ver todas las licencias')],),
              child: Text('Licencias usadas')),
          FilledButton.tonal(onPressed: () {}, child: Text('Mostrar dialogo')),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar SnackBars'),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackBar(context, 'Hola'),
      ),
    );
  }
}
