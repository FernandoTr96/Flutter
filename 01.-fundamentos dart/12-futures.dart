void main() {
  
  print('Inicio...');
  
  httpGet("https://google.com").then((value) => {
    print(value)
  })
  .catchError((error)=>{
    print('Error: $error')
  });

  print('Fin...');

}

Future<String> httpGet(String url){
  return Future.delayed(const Duration(seconds:  1), (){
    throw 'Error en la peticion http';
  });
}