import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naruto_3d/Characters/naruto_uzumaki.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Naruto Shippuden',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const NarutoUzumaki(),
    );
  }
}
