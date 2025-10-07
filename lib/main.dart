import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Act9',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Act9'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _tile(String path) {
    return Expanded(
      child: GestureDetector(
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tapped a button'))),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset(path),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  _tile('assets/images/halloweenghost.png'),
                  const SizedBox(width: 12),
                  _tile('assets/images/halloweenghost2.png'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Row(
                children: [
                  _tile('assets/images/halloweenpumpkin.png'),
                  const SizedBox(width: 12),
                  _tile('assets/images/halloweenpumpkin2.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
