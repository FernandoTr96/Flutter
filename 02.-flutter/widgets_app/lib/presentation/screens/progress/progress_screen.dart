import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
          SizedBox(height: 20),
          Text('Progress indicator'),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black45),
          SizedBox(height: 20),
          Text('Progress indicator circular y lineal controlados'),
          _ControlledProgressIndicator()
         ] 
        )
      )
    );
  }
}


class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value){
        return (value*2) / 100;
      }).takeWhile((value) => value < 100),
      builder:(context, snapshot) {
        final progress = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: progress,strokeWidth: 2, backgroundColor: Colors.black45),
              const SizedBox(width: 20),
              Expanded(
                child: LinearProgressIndicator(value: progress,) 
              )
            ]
          )
        ); 
      } 
    );
  }
}