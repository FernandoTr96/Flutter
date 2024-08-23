void main() {
  print(greetEveryone());
  print(greetEveryoneLambda());
  print(greetPerson(name: 'Fernando'));
}

// funciones tradicionales
String greetEveryone(){
  return 'Hello !';
}

// funciones lambda
String greetEveryoneLambda()=> 'Hello from lambda !';

// funciones con parametros
int addTwoNumbers(int a, int b) => a+b;

// parametros opcionales
int addTwoNumbersOptional(int a, [int b = 0]) {
  // [int? b]  regresa null o el parametro
  // b ??= 0; si no se especifica puedes inicializarlo en 0
  return a+b;
}

// parametros con nombre
// al envolver entre llaves los parametros todos se hacen opcionales y posibles null
// por lo que hay que inicializarlos o indicar que puede ser null 
// los parametros tambien pueden ser requeridos con required
String greetPerson(
  {
    required String name,
    String message = 'How are you'
  }
){
  return 'Hello, ${name} ! ${message}.';
}
