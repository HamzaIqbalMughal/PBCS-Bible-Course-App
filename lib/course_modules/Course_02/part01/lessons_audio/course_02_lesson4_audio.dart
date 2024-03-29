import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../../constants/colors.dart';

class AudioFile {
  final String filePath;
  final String label;

  AudioFile({required this.filePath, required this.label});
}

class Course02Part01Lesson04Audio extends StatefulWidget {
  const Course02Part01Lesson04Audio({Key? key}) : super(key: key);

  @override
  State<Course02Part01Lesson04Audio> createState() =>
      _Course02Part01Lesson04AudioState();
}

class _Course02Part01Lesson04AudioState
    extends State<Course02Part01Lesson04Audio> {
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
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson04%2F1.mp3?alt=media&token=3d801a1b-2fe9-4151-8a19-e9ffd42c65a3',
        label: 'Bani israel k abai bazurgo se khuda ka wada'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson04%2F2.mp3?alt=media&token=5e84b652-0b75-45d9-965d-f0da3dfeeefa',
        label: 'Bani Israel ki aah o pukar paragraph'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson04%2F3.mp3?alt=media&token=d943dea9-1224-4337-bdbe-e42168261f65',
        label: 'Fasah ki Qurbani Paragraph'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson04%2F4.mp3?alt=media&token=5405ee83-1b6f-4446-a0bd-8df859c0546d',
        label: 'Hazrat Moosa aur firaun ka amna samna paragraph'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson04%2F5.mp3?alt=media&token=107c3072-ade4-469b-b80a-873fc540784d',
        label: 'Hazrat Moosa aur Firaun Paragraph'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson04%2F6.mp3?alt=media&token=5ce80163-8ddc-4078-ae36-4bb3b89779ae',
        label: 'Hazrat Moosa pr Khuda ka zahoor'),
    AudioFile(
        filePath:
            'https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/audios%2FCourse02%2FPart01%2FLesson04%2F7.mp3?alt=media&token=bf6906fd-a11e-4b8e-872c-cec3d3c00821',
        label: 'Khuda Bachata hai'),
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
