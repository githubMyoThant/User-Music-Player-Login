// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final userName = TextEditingController();
  final userPsw = TextEditingController();

  bool visibility = true;
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
                    'https://img.freepik.com/free-vector/sign-page-abstract-concept-illustration_335657-2242.jpg?w=740&t=st=1661849458~exp=1661850058~hmac=655de508782d54d96fb919d0c5f100f455dd8845e79efb71fa94408351f00a7d',
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
                          labelText: "Username",
                          // errorText: ,
                          icon: Icon(
                            Icons.email,
                            size: 30,
                          ),
                        ),
                        controller: userName,
                      ),
                      TextFormField(
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
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ButtonTheme(
                          minWidth: 20,
                          height: 100,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.only(
                                      left: 110, right: 110)),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final prefs = await SharedPreferences.getInstance();
                                  await prefs.setString("user", userName.text);
                                  await prefs.setString("userPsw", userPsw.text);
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushNamed(context, '/main');
                                }
                              },
                              child: const Text('Register')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text("Already have an account?"),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {});
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text("Sign In Now!"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
