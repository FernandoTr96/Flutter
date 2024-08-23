void main() {
  
  // Listados
  final numbers = [1,2,3,4,5];

  print('Listado original: ${numbers}');
  print('Listado length: ${numbers.length}');
  print('Listado primero: ${numbers.first}');
  print('Listado ultimo: ${numbers.last}');
  print('Listado reverso: ${numbers.reversed}');

  // reverse regresa un iterable
  // los iterables son todas aquellas listas, arreglos, sets, etc que puedan recorrerse y estan ordenados
  final reversedNumbers = numbers.reversed; 
  
  // Iterable ()
  print('Iterable: ${reversedNumbers}');
  // Lista []
  print('List: ${reversedNumbers.toList()}');
  // Sets {} no permiten duplicados
  print('Set: ${reversedNumbers.toSet()}');

  // where una funcion de los iterables para evaluar cada elemento
  final numberGreaterThan5 = numbers.where((int num){
    return num > 5;
  });

  // se puede convertir entre colecciones
  print(numberGreaterThan5);
  print(numberGreaterThan5.toSet());
}