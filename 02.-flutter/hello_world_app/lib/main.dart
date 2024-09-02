// como no necesito compilar para windows lo desactive
// para volver activar: flutter config --enable-windows-desktop

import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/screens/counters/counter_functions_screen.dart';

// el metodo main ejecutara la aplicacion de flutter mediante runApp
// el componente raiz siempre sera un widget 
void main() {
  runApp(const MyApp());
}

// los widget se dividen en stateless y statefull
// stateless: flutter sabe cuando renderizarlos 
// stateful: contiene un estado que tu manipulas que permite el renderizado del widget
class MyApp extends StatelessWidget{

  // al heredar de la clase statelessWidget o statefulWidget te pide definir el atributo key 
  // este es para identificar el widget en el arbol de widgets o context 
  const MyApp({super.key});

  // tambien nos proporciona un metodo build que dibuja el componente  
  // es ahi donde definimos la vista
  // al ser el widget raiz se utiliza MaterialApp para definir la configuracion del widget raiz
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CounterFunctionsScreen(),
      // define las propiedades del tema o incluso modo oscuro, asi como un tema basado en color unico
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo 
      ),
    );
  }

}