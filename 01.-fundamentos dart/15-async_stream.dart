void main() {
  emitNumbers().listen((value){
    print(value);
  });
}

// El yield funciona en streams para retornar una emision y no un valor
// los stream pueden funcionar con Futures
Stream<int> emitNumbers() async*{
  final values = [1,2,3,4,5];
  for (int i in values) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
