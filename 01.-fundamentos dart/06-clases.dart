void main() {
  final wolverine = Hero(name: 'Logan', power: 'Regeneracion');
  print(wolverine);
  print(wolverine.name);
  print(wolverine.power);
}

class Hero{
  
  String name;
  String power;


  /* Inicializar de forma tradicional hace que la instancia se cree antes de asignar las variables */

  // Hero(String pName, String pPower){
    // This es opcional si las variables no se llaman igual 
    // this.name = pName;
    // this.power = pPower;
    // name = pName;
    // power = pPower;
  // }

  /* Para evitar eso hacerlo asi */
  /*   Hero(String pName, String pPower) :
    name = pName,
    power = pPower;
  */

  /* Una forma mas facil y comun seria */
  /* solo aplica para argumentos posicionales */
  /* Hero(this.name, this.power); */

  /* Cuando se requiere argumentos con nombre y no posicionales, requeridos y no requeridos se usa esta estrictura */
  /* para ello los argumentos se envuelven en {} */
  /* de esta forma ahora los argumentos requeriran nombre y puedes decidir si inicializarlos o requerirlos */
  Hero({ required this.name, this.power = 'No power added'});

  /* Override */
  // Las clases tinen metodos heredados que suelen venir de otras de nuestras clases o de clases del lenguaje
  // es el caso por ejemplo de toString() este metodo es heredado por todos los objetos de dart se podria decir que es un metodo por defecto
  // al ser heredado podemos usar la notacion override para cambiar su comportamiento, este en concreto no es necesario llamarlo porque el print lo hace internamente
  @override
  String toString() {
    return 'Hero{name: $name, power: $power}';
  }
}