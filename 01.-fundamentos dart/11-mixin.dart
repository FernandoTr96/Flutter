// un mixin es una clase que implementa ciertas funcionalidades que nosotros queremos 
// suena a una clase abstracta pero la idea es que una abstracta te deja compartir en elementos del mismo tipo
// un mixin te comparte funcionalidades de cualquier tipo y se le pueden agregar a cualquier clase aun si ya heredo de una clase
// son bloques pequeños de codigo que pueden compartirse sin heredar propiedades
void main() {
  final delfin = Delfin();
  delfin.nadar(); 
}


// clase principal u origen
abstract class Animal{

}


// tipos de animales
abstract class Mamifero extends Animal{

}

abstract class Ave extends Animal{

}

abstract class Pez extends Animal{

}


// especialidad del animal
mixin class Volador{
  void volar()=> print("Volando !");
}

mixin class Caminante{
  void caminar()=> print("Caminando !");
}

mixin class Nadador{
  void nadar()=> print("Nadando !");
}


// animales
class Delfin extends Mamifero with Nadador{}
class Murcielago extends Mamifero with Caminante,Volador{}
class Gato extends Mamifero with Caminante{}
class Pato extends Ave with Caminante,Volador,Nadador{}