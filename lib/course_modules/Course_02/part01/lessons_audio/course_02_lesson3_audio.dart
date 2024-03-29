import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../../constants/colors.dart';

class AudioFile {
  final String filePath;
  final String label;

  AudioFile({required this.filePath, required this.label});
}

class Course02Part01Lesson03Audio extends StatefulWidget {
  const Course02Part01Lesson03Audio({Key? key}) : super(key: key);

  @override
  State<Course02Part01Lesson03Audio> createState() =>
      _Course02Part01Lesson03AudioState();
}

class _Course02Part01Lesson03AudioState
    extends State<Course02Part01Lesson03Audio> {
  List<AudioPlayer> players = [];
  List<bool> isPlayingList = [];
  List<Duration> durationList = [];
  List<Duration> positionList = [];

  String formatTime(int seconds) {
    return '${Duration(seconds: seconds)}'.split('.')[0].padLeft(8, '0');
  }

  List<AudioFile> audioFiles = [
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson03%2F1.mp3?alt=media&token=8348b009-d21d-412f-b791-199a9aa17a84',
        label: 'Bani Israel Misar Mein'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson03%2F2.mp3?alt=media&token=6f41a88e-c4c5-4df5-b49b-bef58f4f73d4',
        label: 'Hazrat Abraham se kiye gaye ilahi wada ka tasalal paragraph'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson03%2F3.mp3?alt=media&token=ee548c04-7bf3-41e0-8412-a8c4ba3b0c79',
        label: 'Hazrat Abraham se wada ki juzwi takmeel Paragraph'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson03%2F4.mp3?alt=media&token=a5a77c0d-e27a-4122-be34-081371784d3d',
        label: 'Hazrat Izhaque se waada paragraph'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson03%2F5.mp3?alt=media&token=a1be92df-ffe4-4192-8c31-d95d9c52b02d',
        label: 'Hazrat Yaqoob ka naya naam'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson03%2F6.mp3?alt=media&token=fb45547d-bdd9-4324-9f73-c7686f8cc760',
        label: 'hazrat yaqoob se waada paragraph'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson03%2F7.mp3?alt=media&token=82a24285-b358-4ad1-bef9-e2d32c70691f',
        label: 'Hazrat Yousaf Bahaisiat hakim-e-misar'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson03%2F8.mp3?alt=media&token=9ead3290-2215-452e-b24a-2de6fbb6d795',
        label: 'Hazrat Yousaf Paragraph'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson03%2F9.mp3?alt=media&token=a1ff41ae-fa58-4b78-bee0-1ad54c2d52d4',
        label: 'Khuda taala ki maooda nasal-e-abraham'),
  ];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < audioFiles.length; i++) {
      final player = AudioPlayer();
      players.add(player);
      isPlayingList.add(false);
      durationList.add(Duration.zero);
      positionList.add(Duration.zero);

      players[i].onPlayerStateChanged.listen((state) {
        setState(() {
          isPlayingList[i] = state == PlayerState.playing;
        });
      });

      players[i].onDurationChanged.listen((newDuration) {
        setState(() {
          durationList[i] = newDuration;
        });
      });

      players[i].onPositionChanged.listen((newPosition) {
        setState(() {
          positionList[i] = newPosition;
        });
      });
    }
  }

  void playAudio(int index) {
    if (!isPlayingList[index]) {
      players[index].play(UrlSource(audioFiles[index].filePath));
    } else {
      players[index].pause();
    }
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    players.forEach((player) {
      player.dispose();
    });

    isPlayingList.clear();
    durationList.clear();
    positionList.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: audioFiles.length,
          itemBuilder: (BuildContext context, int index) {
            final audioFile = audioFiles[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: Colors.grey,
                  width: 0.2,
                ),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: MaterialPrimaryColor,
                  child: IconButton(
                    icon: Icon(
                      isPlayingList[index] ? Icons.pause : Icons.play_arrow,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        playAudio(index);
                      });
                    },
                  ),
                ),
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        audioFile.label,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ]),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Slider(
                      activeColor: MaterialPrimaryColor,
                      inactiveColor: MaterialPrimaryColor.withOpacity(0.5),
                      min: 0,
                      max: durationList[index].inSeconds.toDouble(),
                      value: positionList[index].inSeconds.toDouble(),
                      onChanged: (value) {
                        final position = Duration(seconds: value.toInt());
                        players[index].seek(position);
                      },
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatTime(positionList[index].inSeconds)),
                        Text(formatTime(
                            (durationList[index] - positionList[index])
                                .inSeconds)),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
