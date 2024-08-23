void main() {
  
  // Strings 
  final String pokemon = 'Ditto';

  // Integer
  final int hp = 100;

  // Boolean
  bool isAlive = true;

  // Listas
  final List<String> abilities = ['impostor'];
  final sprites = <String>['ditto/front.png'];

  // Dynamic: por defecto es nulo y sirve para inferir el tipo
  dynamic error = 'Error 404';
  error = true;
  error = [1,2];
  error = ()=> true;
  error = null;

  //impresion multilinea
  print("""
    $pokemon
    $hp
    $isAlive
    $abilities
    $sprites
    $error
  """); 
}