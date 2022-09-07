// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final userName = TextEditingController();
  final userPsw = TextEditingController();
  bool visibility = true;
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Music Player"),
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
                    'https://img.freepik.com/free-vector/access-control-system-abstract-concept_335657-3180.jpg?w=740&t=st=1661848165~exp=1661848765~hmac=d5561b44877a74eb20f9fbfacb038446df114b3ebf88b84fb2ac441f65c63ba3',
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.email,
                            size: 30,
                          ),
                          labelText: "Username",
                        ),
                        controller: userName,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Password",
                              icon: const Icon(
                                Icons.lock,
                                size: 30,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (visibility == true) {
                                        visibility = false;
                                      } else {
                                        visibility = true;
                                      }
                                    });
                                  },
                                  icon: visibility
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility))),
                          obscureText: visibility,
                          obscuringCharacter: '*',
                          controller: userPsw,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                child: ButtonTheme(
                  minWidth: 20,
                  height: 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding:
                              const EdgeInsets.only(left: 120, right: 120)),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final prefs = await SharedPreferences.getInstance();
                          var name = prefs.getString("user");
                          var psw = prefs.getString("userPsw");
                          if (userName.text == name && userPsw.text == psw) {
                            Navigator.pushNamed(context, '/main');
                          } else {
                            Navigator.pushNamed(context, '/login');
                          }
                        }
                      },
                      child: const Text('Login')),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text("Don't have an account?"),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text("Sign Up Now!"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
