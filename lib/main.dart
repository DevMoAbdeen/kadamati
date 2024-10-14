import 'package:flutter/material.dart';

void main() {
  runApp(const KadamatiApp());
}

class KadamatiApp extends StatelessWidget {
  const KadamatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kadamati",
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
