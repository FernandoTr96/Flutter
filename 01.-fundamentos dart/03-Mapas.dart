void main() {
  
  // Los mapas son objetos clave:valor
  final Map<String,dynamic> pokemon = {
    'name': 'Ditto',
    'hp': 100,
    'isAlive': true,
    'abilities': <String>['impostor'],
    'sprites': {
      1: 'ditto/front.png',
      2: 'ditto/back.png'
    }
  };

  // obtener el valor de un mapa
  print(pokemon);
  print('Name: ${pokemon['name']}');
}