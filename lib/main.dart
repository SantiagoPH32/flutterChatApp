import 'package:flutter/material.dart';
import 'package:real_time_chat/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat Page',
      initialRoute: 'login',
      routes: appRoutes,
    );
  }
}
