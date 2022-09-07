import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(top: 0),
          child: Text(
            "Welcome to Music Player",
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://img.freepik.com/free-vector/creative-web-homepage-illustration_52683-79847.jpg?w=740&t=st=1661851851~exp=1661852451~hmac=ca0b93868456bbd82a54418918a4b60834f1e5ed6e6d68be0bd11d1a73cd57e1',
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Welcome!",
                  style: TextStyle(fontSize: 40, color: Colors.blue),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Don't be lonely,we are always",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const Text("with you"),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 60),
                child: ButtonTheme(
                  minWidth: 20,
                  height: 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding:
                              const EdgeInsets.only(left: 120, right: 120)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text('Login')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                child: ButtonTheme(
                  minWidth: 20,
                  height: 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding:
                              const EdgeInsets.only(left: 110, right: 110)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text('Register')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}