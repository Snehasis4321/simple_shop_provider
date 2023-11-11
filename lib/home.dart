import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shop_provider/providers/counter_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test Counter")),
      body: Consumer<CounterProvider>(builder: (context, value, child) {
        return Center(
          child: Text(
            value.getCounter.toString(),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        );
      }),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ElevatedButton(
              onPressed: () {
                Provider.of<CounterProvider>(context, listen: false)
                    .addCounter();
              },
              child: Text("Add counter")),
          ElevatedButton(
              onPressed: () {
                Provider.of<CounterProvider>(context, listen: false)
                    .subtractCounter();
              },
              child: Text("Reduce counter"))
        ]),
      ),
    );
  }
}
