// ignore_for_file: avoid_print, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:audioplayers/audioplayers.dart';

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
        // '/main': (context) => const MusicPlayer()
      },
    );
  }
}

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

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool visibility = true;
  bool validate = false;
  // void funValidate() {
  //   setState(() {
  //     if (validate == null) {
  //       "Value Can't be Empty";
  //     }
  //   });
  // }

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
              const Padding(
                padding: EdgeInsets.only(left: 40, right: 40, top: 40),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      size: 30,
                    ),
                    labelText: "Username",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextField(
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
                      onPressed: () {
                        setState(() {
                        });
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

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              const Padding(
                padding: EdgeInsets.only(left: 40, right: 40, top: 40),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Username",
                      // hintText: "Enter your email address",
                      icon: Icon(
                        Icons.email,
                        size: 30,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextField(
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
                              const EdgeInsets.only(left: 110, right: 110)),
                      onPressed: () {
                        print('Hello');
                      },
                      child: const Text('Register')),
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


// class MusicPlayer extends StatefulWidget {
//   const MusicPlayer({Key? key}) : super(key: key);

//   @override
//   State<MusicPlayer> createState() => _MusicPlayerState();
// }

// class _MusicPlayerState extends State<MusicPlayer> {
//   AudioPlayer audioPlayer = AudioPlayer();

//   // @override
//   // void dispose() {
//   //   audioPlayer.dispose();
//   //   super.dispose();
//   // }

//   // Duration duration = Duration.zero;
//   // Duration position = Duration.zero;

//   String title = "Thunder";
//   String singer = "Song by Imagine Dragon";
//   String image = "images/id.png";

//   // ignore: non_constant_identifier_names
//   bool play_pause = false;
//   var result = 0;

//   List playlist = [
//     {
//       'title': 'Thunder',
//       'artist': 'Song by Imagine Dragon',
//       'song':
//           'https://drive.google.com/uc?export=view&id=1u6CEOeViyOhc6Yo2ncUpZU9bdIvDPAoy',
//       'image': 'images/id.png'
//     },
//     {
//       'title': 'Pretty\'s on the Inside',
//       'artist': 'Song by Chloe Adams',
//       'song':
//           'https://drive.google.com/uc?export=view&id=13gn5Xqv2F4uaX-hnTk5RZBaPpWg8YHIJ',
//       'image': 'images/ca.png'
//     },
//     {
//       'title': 'Issam Alnajjar',
//       'artist': '"Song by Handal Ahbek',
//       'song':
//           'https://drive.google.com/uc?export=view&id=1gyC2swc-G1AF3HKrAf-lyvBHjCGxDUlJ',
//       'image': 'images/ha.png'
//     },
//     {
//       'title': 'One Day',
//       'artist': 'Song by Matisyahu',
//       'song':
//           'https://drive.google.com/uc?export=view&id=1-rrXzuZkHkb5_plSA69Xbe3UqNDELyOA',
//       'image': 'images/mtyh.png'
//     },
//     {
//       'title': 'There\'s Nothing Holding Me Back',
//       'artist': 'Song by Shawn Mendes',
//       'song':
//           'https://drive.google.com/uc?export=vidw&id=1TyytsXbpmGrWxS81nylS5RoDe0Bt0O1G',
//       'image': 'images/Sm.png'
//     },
//     {
//       'title': 'Waving Flag',
//       'artist': 'Song By K\'naan',
//       'song':
//           'https://drive.google.com/uc?export=view&id=1EbGVWVJUhiI-NYnaJxSypReMzL6DRBOF',
//       'image': 'images/Kn.png'
//     },
//   ];
//   String url =
//       "https://drive.google.com/uc?export=view&id=1u6CEOeViyOhc6Yo2ncUpZU9bdIvDPAoy";

//   play() async {
//     int result = await audioPlayer.play(url);
//     if (result == 1) {
//       setState(() {
//         play_pause = true;
//       });
//     }
//   }

//   void change() {
//     setState(() {
//       if (url == playlist[0]['song']) {
//         image = playlist[0]['image'];
//         title = playlist[0]['title'];
//         singer = playlist[0]['artist'];
//         url = playlist[0]['song'];
//         play();
//       } else if (url == playlist[1]['song']) {
//         image = playlist[1]['image'];
//         title = playlist[1]['title'];
//         singer = playlist[1]['artist'];
//         url = playlist[1]['song'];
//         play();
//       } else if (url == playlist[2]['song']) {
//         image = playlist[2]['image'];
//         title = playlist[2]['title'];
//         singer = playlist[2]['artist'];
//         url = playlist[2]['song'];
//         play();
//       } else if (url == playlist[3]['song']) {
//         image = playlist[3]['image'];
//         title = playlist[3]['title'];
//         singer = playlist[3]['artist'];
//         url = playlist[3]['song'];
//         play();
//       } else if (url == playlist[4]['song']) {
//         image = playlist[4]['image'];
//         title = playlist[4]['title'];
//         singer = playlist[4]['artist'];
//         url = playlist[4]['song'];
//         play();
//       } else {
//         image = playlist[5]['image'];
//         title = playlist[5]['title'];
//         singer = playlist[5]['artist'];
//         url = playlist[5]['song'];
//         play();
//       }
//     });
//   }

//   void randomSongs() {
//     setState(() {
//       playlist.shuffle();
//       if (playlist[0]['song'] != 0) {
//         url = playlist[0]['song'];
//         change();
//       }
//     });
//   }

//   void nextSongs() {
//     setState(() {
//       if (result >= 0) {
//         result = result;
//         if (result == 6) {
//           result = 0;
//         }
//         print(result);
//       }
//       result++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Welcome to Music Player"),
//         // backgroundColor: Colors.black45,
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 40,
//             ),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.asset(
//                 image,
//                 height: 300,
//                 width: 300,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               title,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(singer),
//             // Slider(
//             //     min: 0,
//             //     max: duration.inSeconds.toDouble(),
//             //     value: position.inSeconds.toDouble(),
//             //     onChanged: (value) async {

//             //     }),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: TextButton(
//                       onPressed: () {
//                         randomSongs();
//                       },
//                       child: const Icon(
//                         Icons.shuffle_sharp,
//                         color: Colors.black,
//                       )),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     // previousSongs();
//                   },
//                   child: const Padding(
//                     padding: EdgeInsets.only(left: 5),
//                     child: Icon(
//                       CupertinoIcons.backward_end_alt_fill,
//                       color: Colors.black,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () async {
//                     if (play_pause == true) {
//                       await audioPlayer.pause();
//                       setState(() {
//                         play_pause = false;
//                       });
//                     } else {
//                       play();
//                     }
//                   },
//                   child: play_pause == true
//                       // ignore: prefer_const_constructors
//                       ? Icon(
//                           size: 60,
//                           Icons.pause,
//                           color: Colors.black,
//                         )
//                       // ignore: prefer_const_constructors
//                       : Icon(
//                           size: 60,
//                           Icons.play_arrow,
//                           color: Colors.black,
//                         ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     nextSongs();
//                   },
//                   child: const Padding(
//                     padding: EdgeInsets.only(right: 5),
//                     child: Icon(
//                       CupertinoIcons.forward_end_alt_fill,
//                       size: 30,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 10),
//                   child: TextButton(
//                       onPressed: () {
//                         // loopSongs();
//                       },
//                       child: const Icon(
//                         Icons.loop_sharp,
//                         color: Colors.black,
//                       )),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
