void main() {
  final mySquare = Square(side: 5.0);
  mySquare.setSide(5.0);
  print(mySquare.getSide);
  print(mySquare.getArea);
}

class Square{
  
  double _side;

  // Se pueden usar aserciones para validar desde el constructor los parametros
  Square({ required side }) : 
  assert(side >= 0, 'side must be greater or equal to 0'),
  _side = side;  

  double get getSide{
    return _side;
  }

  setSide(double value){
    // otra forma de validar es usar aserciones
    //if(value < 0) throw 'Negative values are not allowed !';
    _side = value;
  }

  double get getArea{
    return _side * _side;
  }

}