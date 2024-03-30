import 'package:flutter/material.dart';
import 'package:myportfolioflutter/mobile_pages/main_page_mobile.dart';
import 'package:myportfolioflutter/pages/mainpage.dart';
import 'dart:html' as html;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      title: 'Welcome to my portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: width > 929 ? MainPage() : MainPageMobile()

    );
  }
}
