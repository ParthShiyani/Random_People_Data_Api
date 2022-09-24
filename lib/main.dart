import 'package:flutter/material.dart';
import 'package:random_datas/helper/random_api_helper.dart';
import 'package:random_datas/models/random.dart';
import 'package:random_datas/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    ),
  );
}
