import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../../constants/colors.dart';

class AudioFile {
  final String filePath;
  final String label;

  AudioFile({required this.filePath, required this.label});
}

class Course02Part01Lesson05Audio extends StatefulWidget {
  const Course02Part01Lesson05Audio({Key? key}) : super(key: key);

  @override
  State<Course02Part01Lesson05Audio> createState() =>
      _Course02Part01Lesson05AudioState();
}

class _Course02Part01Lesson05AudioState
    extends State<Course02Part01Lesson05Audio> {
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
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson05%2F1.mp3?alt=media&token=23b918d9-9244-48d8-b464-ce88028a5a40',
        label: 'Abraham se kiye giye ilahi waday ka zair-e-takmeel hissa'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson05%2F2.mp3?alt=media&token=2a129dc6-c25d-443a-b8c2-87f3e05e46b0',
        label: 'Abraham se kiye giye ilahi waday ky aik hissa ki takmeel'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson05%2F3.mp3?alt=media&token=b0f9a1bc-7dc0-4645-9645-2494ebd97345',
        label: 'Bani Israel ka gunah aur khuda ka fazal'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson05%2F4.mp3?alt=media&token=90811b8a-fc66-4d8d-af58-463129fe40db',
        label: 'Bani Israel ki kam aetkadi aur us ka nateeja'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson05%2F5.mp3?alt=media&token=4b8e712d-b0af-48c7-acd6-198b8b469fb0',
        label: 'bani israel mulk-e-kanaan mein'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson05%2F6.mp3?alt=media&token=4e5ae4a9-5a76-420d-8d19-baff3ad99221',
        label: 'Israeli rahnumaon ki kam aetkadi aur us ka nateja'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson05%2F7.mp3?alt=media&token=a3e40dba-93bd-4fa8-a0b1-a956a8b8fa94',
        label: 'Khuda apni shariat atta krta hai'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson05%2F8.mp3?alt=media&token=ac8ca005-a96f-4261-abbf-f8f880102e07',
        label:
            'Khuda najat deta hai (Biyaban mein Khuda tala ki parwatdigari)'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson05%2F9.mp3?alt=media&token=55f544cd-d112-4a32-84c8-63dde05206d2',
        label: 'Nai nasal aur nai qiadat'),
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

  void playAudio(int index) {
    if (!isPlayingList[index]) {
      players[index].play(UrlSource(audioFiles[index].filePath));
    } else {
      players[index].pause();
    }
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
