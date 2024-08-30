void main() {
  final mySquare = Square(side: 5.0);
  // ya no es posible acceder porque mi variable es privada debo usar getters and setters
  /* mySquare.side = 10; */
  mySquare.setSide(5.0);
  print(mySquare.getSide);
  print(mySquare.getArea);
}

class Square{
  
  double _side;

  Square({ required side }) : 
  _side = side;  

  double get getSide{
    return _side;
  }

  setSide(double value){
    if(value < 0) throw 'Negative values are not allowed !';
    _side = value;
  }

  double get getArea{
    return _side * _side;
  }

}