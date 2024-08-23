// En dart la funcion principal es main por lo general es void
// Si no pones void la dejara como dynamic el cual infiere el valor
void main(){

  // tipo var al igual que dynamic infiere el valor pero este es para variables
  var age = 10;

  // inicializacion de variables tardias con late
  // se usa late cuando en ese momento no vas a incializar un valor pero quieres declararla e indicar que lo tendra
  late String name;

  // las constantes en dart se dividen en 2 tipos 
  // final: Es una constante que no cambia, pero en tiempo de ejecucion puede ser modificada (tiempo de ejecucion)
  // const: Es una constante que no puede ser mofidficada en ninguna fase del ciclo de vida

  final date = new DateTime.now();
  const bloodTypes = ['A+','B-'];

  // inicializo en algun punto la variable late
  name = 'Fernando';

  // imprimir valores
  print('Hello World !');
  print(age);
  print(name);
  print(date);
  print(bloodTypes);
}