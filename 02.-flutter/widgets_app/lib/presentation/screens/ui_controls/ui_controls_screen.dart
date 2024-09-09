import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {

  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI controls + Tiles'),
      ),

      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation {car, plane, boat, submarine}

class _UiControlsViewState extends State<_UiControlsView> {

  bool wantsDinner = false;
  bool isDevMode = false;
  Transportation currentTransport = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        // switch 
        SwitchListTile(
          title: const Text('Dev mode'),
          subtitle: const Text('Habilitar modo desarrollador'),
          value: isDevMode, 
          onChanged: (value) => setState(() {
            isDevMode = !isDevMode;
          })
        ),

        // Expansion tile
        ExpansionTile(
          title: const Text('Choose your vehicle'),
          subtitle: Text('Current: ${currentTransport.name}'), 
          children: [  //radio
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('By car'),
              value: Transportation.car, 
              groupValue: currentTransport, 
              onChanged: (value)=> setState(() {
                currentTransport = Transportation.car;
              })
            ),
            RadioListTile(
              title: const Text('Plane'),
              subtitle: const Text('By plane'),
              value: Transportation.plane, 
              groupValue: currentTransport, 
              onChanged: (value)=> setState(() {
                currentTransport = Transportation.plane;
              })
            ),
            RadioListTile(
              title: const Text('Boat'),
              subtitle: const Text('By boat'),
              value: Transportation.boat, 
              groupValue: currentTransport, 
              onChanged: (value)=> setState(() {
                currentTransport = Transportation.boat;
              })
            ),
            RadioListTile(
              title: const Text('Submarine'),
              subtitle: const Text('By submarine'),
              value: Transportation.submarine, 
              groupValue: currentTransport, 
              onChanged: (value)=> setState(() {
                currentTransport = Transportation.submarine;
              })
            ),
          ]
        ),

        //checkboxListTile
        CheckboxListTile(
          title: const Text('Include dinner ?'),
          value: wantsDinner, 
          onChanged: (value)=> setState(() {
            wantsDinner = !wantsDinner;
          })
        )

      ]
    );
  }
}