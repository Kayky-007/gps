import 'package:flutter/material.dart';
import 'package:gps_oncoto/views/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true, title: Text('Descubra sua localização'),
        ),
        body: HomeView(),
      ),
    );
  }
} 