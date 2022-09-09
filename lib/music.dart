// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MusicPlayer(),
    );
  }
}

// stf or statefulW
class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        play_pause = state == PlayerState.PLAYING;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  String title = "Thunder";
  String singer = "Song by Imagine Dragon";
  String image = "images/id.png";

  // ignore: non_constant_identifier_names
  bool play_pause = false;
  var result = 6;

  List playlist = [
    {
      'title': 'Thunder',
      'artist': 'Song by Imagine Dragon',
      'song':
          'https://drive.google.com/uc?export=view&id=1u6CEOeViyOhc6Yo2ncUpZU9bdIvDPAoy',
      'image': 'images/id.png'
    },
    {
      'title': 'Pretty\'s on the Inside',
      'artist': 'Song by Chloe Adams',
      'song':
          'https://drive.google.com/uc?export=view&id=13gn5Xqv2F4uaX-hnTk5RZBaPpWg8YHIJ',
      'image': 'images/ca.png'
    },
    {
      'title': 'Issam Alnajjar',
      'artist': '"Song by Handal Ahbek',
      'song':
          'https://drive.google.com/uc?export=view&id=1gyC2swc-G1AF3HKrAf-lyvBHjCGxDUlJ',
      'image': 'images/ha.png'
    },
    {
      'title': 'One Day',
      'artist': 'Song by Matisyahu',
      'song':
          'https://drive.google.com/uc?export=view&id=1-rrXzuZkHkb5_plSA69Xbe3UqNDELyOA',
      'image': 'images/mtyh.png'
    },
    {
      'title': 'There\'s Nothing Holding Me Back',
      'artist': 'Song by Shawn Mendes',
      'song':
          'https://drive.google.com/uc?export=vidw&id=1TyytsXbpmGrWxS81nylS5RoDe0Bt0O1G',
      'image': 'images/Sm.png'
    },
    {
      'title': 'Waving Flag',
      'artist': 'Song By K\'naan',
      'song':
          'https://drive.google.com/uc?export=view&id=1EbGVWVJUhiI-NYnaJxSypReMzL6DRBOF',
      'image': 'images/Kn.png'
    },
  ];
  String url =
      "https://drive.google.com/uc?export=view&id=1u6CEOeViyOhc6Yo2ncUpZU9bdIvDPAoy";

  play() async {
    int result = await audioPlayer.play(url);
    if (result == 1) {
      setState(() {
        play_pause = true;
      });
    }
  }

  void change() {
    setState(() {
      if (url == playlist[0]['song']) {
        image = playlist[0]['image'];
        title = playlist[0]['title'];
        singer = playlist[0]['artist'];
        url = playlist[0]['song'];
        play();
      } else if (url == playlist[1]['song']) {
        image = playlist[1]['image'];
        title = playlist[1]['title'];
        singer = playlist[1]['artist'];
        url = playlist[1]['song'];
        play();
      } else if (url == playlist[2]['song']) {
        image = playlist[2]['image'];
        title = playlist[2]['title'];
        singer = playlist[2]['artist'];
        url = playlist[2]['song'];
        play();
      } else if (url == playlist[3]['song']) {
        image = playlist[3]['image'];
        title = playlist[3]['title'];
        singer = playlist[3]['artist'];
        url = playlist[3]['song'];
        play();
      } else if (url == playlist[4]['song']) {
        image = playlist[4]['image'];
        title = playlist[4]['title'];
        singer = playlist[4]['artist'];
        url = playlist[4]['song'];
        play();
      } else {
        image = playlist[5]['image'];
        title = playlist[5]['title'];
        singer = playlist[5]['artist'];
        url = playlist[5]['song'];
        play();
      }
    });
  }

  void randomSongs() {
    setState(() {
      playlist.shuffle();
      if (playlist[0]['song'] != 0) {
        url = playlist[0]['song'];
        change();
      }
    });
  }

  void nextSongs() {
    setState(() {
      if (result >= 0) {
        result = result;
        if (result == 6) {
          result = 0;
        }
        url = playlist[result]['song'];
        change();
      }
      result++;
    });
  }

  void previousSongs() {
    setState(() {
      if (result <= playlist.length) {
        result = result - 1;
        if (result == -1) {
          result = 6;
        }
        url = playlist[result]['song'];
        change();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Player"),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(singer),
            Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextButton(
                      onPressed: () {
                        randomSongs();
                      },
                      child: const Icon(
                        Icons.shuffle_sharp,
                        color: Colors.black,
                      )),
                ),
                TextButton(
                  onPressed: () {
                    previousSongs();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      CupertinoIcons.backward_end_alt_fill,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    if (play_pause == true) {
                      await audioPlayer.pause();
                      setState(() {
                        play_pause = false;
                      });
                    } else {
                      play();
                    }
                  },
                  child: play_pause == true
                      // ignore: prefer_const_constructors
                      ? Icon(
                          size: 60,
                          Icons.pause,
                          color: Colors.black,
                        )
                      // ignore: prefer_const_constructors
                      : Icon(
                          size: 60,
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                ),
                TextButton(
                  onPressed: () {
                    nextSongs();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(
                      CupertinoIcons.forward_end_alt_fill,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton(
                      onPressed: () {
                        // loopSongs();
                      },
                      child: const Icon(
                        Icons.loop_sharp,
                        color: Colors.black,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
