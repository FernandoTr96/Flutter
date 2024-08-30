void main() {
  
  final Map<String,dynamic> rawJson = {
    'name': 'Logan',
    'power': 'Regeneracion'
  };

  final wolverine = Hero.fromJson(rawJson);

  print(wolverine);
  
}

class Hero{

  String name;
  String power;

  // constructor normal
  Hero({ required this.name,  required this.power});

  // constructor con nombre o sobrecarga de constructores recibe un json e inicializa mi clase con sus valores
  Hero.fromJson(Map<String,dynamic> json): 
  name = json['name'] ?? 'No name found',
  power = json['power']?? 'No power found';

  @override
  String toString() {
    return 'Hero{name: $name, power: $power}';
  }

}