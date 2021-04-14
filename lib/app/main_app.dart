import 'package:flutter/material.dart';
import 'package:remote_config_tutorial/ui/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key, required this.appBarTitle}) : super(key: key);

  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(appBarTitle: appBarTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}
