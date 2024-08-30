void main() {
  final windPlant = WindPlant(initialEnergy: 100);
  windPlant.consumeEnergy(10);
}

// Las clases abstractas son un molde que puedes compartir con otras clases cuando tienen cosas en comun

enum EnergyPlantType {
  wind,
  solar,
  hydroelectric
}

abstract class EnergyPlant{

  double energyLeft;
  EnergyPlantType type;

  EnergyPlant({
    required this.energyLeft,
    required this.type
  });

  void consumeEnergy(double consumption);

}

// La clase WindPlant al ser una planta puede aplicar la clase abstracta porque puede que necesite funcionalidades para todas las plantas
// hay 2 formas de usar la clase abstracta mediante herencia o implementaciones
// herencia: compartira todos los metodos y atributos de la clase abstracta, por lo que la clase que hereda debe satisfacer sus requisitos
// implementaciones: 

class WindPlant extends EnergyPlant{

  // al heredar de una clase si esta tiene requisitos como parametros requeridos o metodos se le deben declarar a la clase que hereda
  WindPlant({ required double initialEnergy }):
  super(energyLeft: initialEnergy, type: EnergyPlantType.wind);

  // metodos que hereda
  @override
  void consumeEnergy(double consumption) {
    energyLeft -= consumption;
    print('Wind plant consumed $consumption, energy left: $energyLeft'); 
  }
}