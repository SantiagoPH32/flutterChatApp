import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_time_chat/routes/routes.dart';
import 'package:real_time_chat/services/auth_services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat Page',
        initialRoute: 'loading',
        routes: appRoutes,
      ),
    );
  }
}
