import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Programa Layout'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final random = Random();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          for (var i = 0; i < 8; i++)
            Positioned(
              left: random.nextDouble() * screenWidth,
              top: random.nextDouble() * screenHeight,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.primaries[i % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          for (var i = 0; i < 4; i++) 
            Positioned(
              left: screenWidth - 60,
              top: random.nextDouble() * screenHeight,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.primaries[(i + 8) % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          Center(
            child: Container(
              width: 200,
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text('Olá Mundo!'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


