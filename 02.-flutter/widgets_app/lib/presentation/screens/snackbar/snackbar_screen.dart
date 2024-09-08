import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Hello'),
      action: SnackBarAction(label: 'OK', onPressed: (){}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) {
        return AlertDialog(
          title:  const Text('Are u shure ?'),
          content: const Text('lorem ipsu dolore mis satyurn no iptetumenasdasdas'),
          actions: [
            TextButton(onPressed: ()=> context.pop(), child: const Text('Ok')),
            TextButton(onPressed: ()=> context.pop(), child: const Text('Cancel')),
          ]
        ); 
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alertas y dialogos')
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context), 
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [const Text('Lorem ipsu dolore mia')]
                );
              }, 
              child: const Text('Licencias usadas')
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar dialogo')
            )
          ]
        )
      )
    );
  }
}