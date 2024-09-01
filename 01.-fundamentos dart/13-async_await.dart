void main() async {
  
  print('Inicio...');
  
  try {
    final value = await httpGet('https://google.com');
    print(value);
  } catch (e) {
    print('Error: $e');
  }

  print('Fin...');

}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds:  1));
  throw 'Error no controlado';
 /*  return 'Response successfully !'; */
}