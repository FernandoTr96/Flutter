import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

// riverpod tiene widgets para manejar su estado
// ConsumerWidget: te deja observar un provider para renderizar si el estado cambia, si todo lo hace el provider este debe usarse, es equivalente a un stateless
// ConsumerStatefullWidget: te deja observar el provider y mantener un estado interno, si el widget es complejo usar este, es como un statefullwidget
class CounterScreen extends ConsumerWidget {

  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Riverpod'),
      ),
      body: Center(
        child: Text('$clickCounter', style: const TextStyle(fontSize: 100))
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // mutar el estado en riverpod
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      )
    );
  }
}