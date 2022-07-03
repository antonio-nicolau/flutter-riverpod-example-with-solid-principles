import 'package:flutter/material.dart';
import 'package:giphy_for_all/features/home/home.page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giphy for all',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}
