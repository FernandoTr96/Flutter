void main() async {
  
  print('Inicio...');
  
  try {
    final value = await httpGet('https://google.com');
    print(value);
  }
  on Exception catch(e){
    print(e);
  } catch (e) {
    print('Ops !! algo terrible paso: $e');
  }
  finally{
    print("Fin try catch...");
  }

  print('Fin...');

}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds:  1));
  throw Exception('ex 10937 !');
 /*  throw 'Error no controlado'; */
 /*  return 'Response successfully !'; */
}