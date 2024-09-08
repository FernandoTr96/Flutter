
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  
  static const name = 'buttons_screen';
  
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter buttons')),
      body: Scaffold(
        body: const _ButtonsView(),
        // Boton flotante
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back),
          onPressed: () => context.pop()
        )
      )
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            // Boton elevado
            ElevatedButton(
              onPressed: () {}, 
              child: const Text('Elevated')
            ),
            // Elevated button con icono
            ElevatedButton.icon(
              onPressed: () {}, 
              icon: const Icon(Icons.save),
              label: const Text('Elevated Icon'),
            ),
            // Boton desactivado solo ocupa null en su onPress
            const ElevatedButton(
              onPressed: null, 
              child: Text('Elevated disabled')
            ),
            // Filled buttons
            FilledButton(
              onPressed: () {}, 
              child: const Text('Filled')
            ),
            FilledButton.icon(
              onPressed: () {}, 
              icon: const Icon(Icons.plus_one),
              label: const Text('Filled Icon'),
            ),
            // Outline Buttons
            OutlinedButton(
              onPressed: () {}, 
              child: const Text('Outline')
            ),
            OutlinedButton.icon(
              onPressed: () {}, 
              icon: const Icon(Icons.plus_one),
              label: const Text('Otline Icon'),
            ),
            // TextButton
            TextButton(
              onPressed: () {}, 
              child: const Text('Text')
            ),
            TextButton.icon(
              onPressed: () {}, 
              icon: const Icon(Icons.plus_one),
              label: const Text('Text Icon'),
            ),
            // Icon Buttons
            IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.usb_rounded),
            ),
            IconButton.filled(
              onPressed: () {}, 
              icon: const Icon(Icons.usb_rounded),
            ),
            const CustomButton()
          ]
        )
      )
    );
  }
}


// Boton personalizado

class CustomButton extends StatelessWidget {

  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).colorScheme;

    return  ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        // Inkwell es basicamente tap pero que agrega el splash 
        color: theme.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Custom Button', style: TextStyle(color: Colors.white)),
          ),
        )
      ),
    );
  }
}