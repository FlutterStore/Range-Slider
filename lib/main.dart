import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Rangesliders(),
    );
  }
}


class Rangesliders extends StatefulWidget {
  const Rangesliders({super.key});

  @override
  State<Rangesliders> createState() => _RangeslidersState();
}

class _RangeslidersState extends State<Rangesliders> {
  double cs=1,ce=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text("Range Slider",style: TextStyle(fontSize: 15),),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            RangeSlider(
              min: 1,
              max: 100,
              values: RangeValues(cs,ce),
              onChanged:(values){
                setState(() {
                  cs = values.start;
                  ce = values.end;
                });
              },
              divisions: 100,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              labels: RangeLabels(cs.toString(),ce.toString()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                  ),
                  onPressed: () {
                    if(ce != 1){
                      setState(() {
                        ce--;
                      });
                    }
                  }, 
                  child: const Icon(Icons.remove,color: Colors.white,)
                ),
                OutlinedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                  ),
                  onPressed: () {
                    if(ce != 1){
                      setState(() {
                        ce++;
                      });
                    }
                  }, 
                  child: const Icon(Icons.add,color: Colors.white,)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}