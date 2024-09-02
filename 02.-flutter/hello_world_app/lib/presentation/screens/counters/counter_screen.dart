import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {

  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter Screen'))
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter', style: const TextStyle(fontSize: 150, fontWeight: FontWeight.bold, color: Colors.indigo)),
            Text('Click${counter == 1 ? '' : 's'}', style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.grey))
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counter++;
          setState((){});
        },
        child: const Icon(Icons.plus_one)
      )
    );
  }
}