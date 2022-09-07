import 'package:flutter/material.dart';
import 'package:flutter_login/register.dart';
import 'package:flutter_login/login.dart';
import 'package:flutter_login/login_or_register.dart';
import 'package:flutter_login/music.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/choose_login',
      routes: {
        '/choose_login': (context) => const LoginOrRegister(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/main': (context) => const MusicPlayer()
      },
    );
  }
}




