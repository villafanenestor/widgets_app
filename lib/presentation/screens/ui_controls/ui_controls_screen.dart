 import 'package:flutter/material.dart';

class UIControlScreen extends StatelessWidget {
  static const name = 'uicontrolscreen_screen';

  const UIControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Control Screen'),),
      body: _UiControlView(),
    );
  }
}

enum Transportation {car, bike, biker, boat, plane}
class _UiControlView extends StatefulWidget {
  
  const _UiControlView({
    super.key,
  });

  @override
  State<_UiControlView> createState() => _UiControlViewState();
}
    bool isDev = true;
    Transportation transportationSelected = Transportation.car;

class _UiControlViewState extends State<_UiControlView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          title: Text('Developer Mode'),
          value: isDev, onChanged: (value) => setState(() {
              isDev = !isDev;
            }),
        ),
        RadioListTile(
          title: Text('Carros'),
         value: Transportation.car,
         groupValue: transportationSelected,
         onChanged: (value) => setState(() {
           
         })
         ),
         ExpansionTile(title: Text('Vehiculo de transporte'), 
         children: [],)
        ],
    );
  }
}