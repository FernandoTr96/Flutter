void main() {
  final wolverine = Hero('Logan', 'Regeneracion');
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
  Hero(this.name, this.power);
}