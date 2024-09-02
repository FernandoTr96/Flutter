import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Counter Functions Screen')),
          leading: const Icon(Icons.numbers),
          actions: [
            IconButton(
                onPressed: () {
                  counter = 0;
                  setState(() {});
                },
                icon: const Icon(Icons.refresh_rounded))
          ],
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('$counter',
              style: const TextStyle(
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo)),
          Text('Click${counter == 1 ? '' : 's'}',
              style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey))
        ])),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingButton(icon: Icons.refresh, onPressed: (){
              setState(() {
               counter = 0;
              });
            }),
            const SizedBox(height: 15),
            FloatingButton(icon: Icons.plus_one, onPressed: (){
              setState(() {
               counter++;
              });
            }),
            const SizedBox(height: 15),
            FloatingButton(icon: Icons.exposure_minus_1_outlined, onPressed: (){
              if(counter == 0) return;
              setState(() {
               counter--;
              });
            })
          ]
        ));
  }
}

class FloatingButton extends StatelessWidget {
  
  final IconData icon;
  final VoidCallback? onPressed;

  const FloatingButton({
    super.key,
    required this.icon,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icon)
    );
  }
}
