
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pbcs_bible_course/New%20Views/Lesson.dart';
import 'package:pbcs_bible_course/New%20Views/audiolists.dart';
import 'package:pbcs_bible_course/New%20Views/lessonData.dart';
import 'package:pbcs_bible_course/New%20Views/quizview.dart';
import 'package:pbcs_bible_course/New%20Views/sliderprovider.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../course_modules/Course_02/part01/lessons_audio/Course02Taurf.dart';
class CourseScreen extends StatefulWidget {
  final String text;
  final String title;
  final String lessonNo;
  const CourseScreen({super.key, required this.text, required this.title, required this.lessonNo});
  @override
  State<CourseScreen> createState() => _CourseScreenState();
}
final AudioPlayer audioPlayer = AudioPlayer();
class _CourseScreenState extends State<CourseScreen> {
   // Variable to track the current position
  String val = '';
  final FirebaseFirestore fireStoreDB = FirebaseFirestore.instance;
  final refStorage = FirebaseStorage.instance.ref();
  int currentAudioIndex = 0;
  AudioListsAndQuestionsList audioListsData = AudioListsAndQuestionsList();
  List<AudioFile> audioList = [];
  bool isPlaying = false;
  Duration curX = Duration.zero;
  List<LessonModel> course1 = [];
  String lessonName = '';
  String courseName = '';
  AllCoursesLessonsData courseData = AllCoursesLessonsData();
  bool isPaused = false;
  bool initial = true;
  Duration audioDuration = Duration.zero;
  Duration audioPosition = Duration.zero;
  Duration currentPosition = Duration.zero;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial = true;
    setState(() {

    });
    lessonName = widget.lessonNo;
    courseName = widget.title;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();

  }
  @override
  Widget build(BuildContext context,) {
    final sliderProvider = Provider.of<SliderProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () async{
            if(isPlaying){
              audioPlayer.pause();
            }
          isPlaying = false;
            setState(() {
            });
          Navigator.pop(context);
          },),
        backgroundColor: appPrimaryColor,
        title: Text("$courseName $lessonName"),
      ),
      body: WillPopScope(
        onWillPop: ()async {
          if(isPlaying){
          audioPlayer.pause();
        }
        isPlaying = false;
        return false;
        },
        child: Column(
          children: [
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * .02,),
            FutureBuilder(
                future: GetSetData(),
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .4,
                        ),
                        Center(
                          child: CircularProgressIndicator(
                            color: appPrimaryColor,
                          ),
                        )
                      ],
                    );
                  }
                  else{
                    if(lessonName == "Introduction"){
                      return Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex:1,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Consumer(builder: (context, ref, child) {
                                     // final isPlaying = ref.watch(audioButtonProvider);
                                      return InkWell(
                                        onTap: () async {
                                         // ref.read(audioButtonProvider.notifier).toggleAudioButton();
                                          playAudios(context);
                                        },
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(left: 10, top: 0),
                                              decoration: BoxDecoration(
                                                color: appPrimaryColor,
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              height: MediaQuery.of(context).size.height * .07,
                                              width: MediaQuery.of(context).size.width * .15,
                                              child: Center(
                                                child: Icon(
                                                  isPlaying ? CupertinoIcons.pause_solid : CupertinoIcons.play_fill,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                    child: Consumer<SliderProvider>(
                                      builder: (context,val,child){
                                        return Slider(
                                          min: 0,
                                            max: 100,
                                            value: val.value,
                                            onChanged: (v){
                                              val.value = v;
                                              final seekPosition = Duration(seconds: v.toInt());
                                              audioPlayer.seek(seekPosition);
                                            }
                                        );
                                      },
                                    )
                                ),
                              ],
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                                      child: Text(
                                        val,
                                        style: const TextStyle(fontSize: 20),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.01,
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.02,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }else{
                      return Expanded(
                        child: Column(
                            children:[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Consumer(builder: (context, ref, child) {
                                 // final isPlaying = ref.watch(audioButtonProvider);
                                  return InkWell(
                                    onTap: () async {
                                  //    ref.read(audioButtonProvider.notifier).toggleAudioButton();
                                      playAudios(context);
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(left: 10, top: 0),
                                          decoration: BoxDecoration(
                                            color: appPrimaryColor,
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                          height: MediaQuery.of(context).size.height * .07,
                                          width: MediaQuery.of(context).size.width * .15,
                                          child: Center(
                                            child: Icon(
                                              isPlaying ? CupertinoIcons.pause_solid : CupertinoIcons.play_fill,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                                        child: Text(val,
                                          style: const TextStyle(fontSize: 20),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * .01,
                                      ),
                                      Center(
                                        child: InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen(courseName: courseName,lessonName: lessonName,)));
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context).size.height * .05,
                                            width: MediaQuery.of(context).size.width * .5,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              color: appPrimaryColor,
                                            ),
                                            child: Center(child: Text('Take Exam',style: TextStyle(fontSize: 17,color: Colors.white),)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * .02,
                                      ),
                                    ],
                                  )
                                ),
                              ),
                            ]
                        ),
                      );
                    }
                  }
                }
                )
          ],
        ),
      ),
    );
  }
  void playAudios(BuildContext context) async {
    if (isPlaying) {
      if (isPaused) {
        // Resume from where it was paused
        await audioPlayer.seek(currentPosition);
        isPaused = false;
        await audioPlayer.play();
      } else {
        // Pause the audio
        currentPosition = await audioPlayer.position;
        isPaused = true;
        await audioPlayer.pause();
      }
    } else {
      await audioPlayer.setUrl(audioList[0].filePath);
      isPlaying = true;
      isPaused = false;
      await audioPlayer.play();
    }
    if(!isPaused){
      audioPlayer.playerStateStream.listen((playerState){
        //curX = audioPlayer.position;
        //final sliderProvider = Provider.of<SliderProvider>(context,);
        //sliderProvider.value = curX.inSeconds.toDouble();
        // setState(() {
        //
        // });
        if (playerState.processingState == ProcessingState.completed) {
          playNextAudio();
        }
      });
    }
  }
  void playNextAudio() async {
    if (currentAudioIndex < audioList.length - 1) {
      currentAudioIndex++;
      await audioPlayer.setUrl(audioList[currentAudioIndex].filePath);
      await audioPlayer.play();
    } else {
      currentAudioIndex = 0;
      await audioPlayer.stop();
      isPlaying = false;
    }
  }
  Future<void> GetSetData() async {
    // DocumentSnapshot documentSnapshot =
    // await fireStoreDB.collection(widget.title).doc(widget.lessonNo).get();
    // val = documentSnapshot['content'];
    String x = "${widget.title} ${widget.lessonNo}";
    switch(x) {
      case "Course 01 Introduction": {
        val = courseData.course1Introduction;
        audioList = audioListsData.course1Introduction;
      }
      break;
      case "Course 01 Lesson 01": {
        val = courseData.course1lesson1;
        audioList = audioListsData.course1lesson1;
      }
      break;
      case "Course 01 Lesson 02": {
        val = courseData.course1lesson2;
        audioList = audioListsData.course1lesson2;
      }
      break;
      case "Course 01 Lesson 03": {
        val = courseData.course1lesson3;
        audioList = audioListsData.course1lesson3;
      }
      break;
      case "Course 01 Lesson 04": {
        val = courseData.course1lesson4;
        audioList = audioListsData.course1lesson4;
      }
      break;
      case "Course 01 Lesson 05": {
        val = courseData.course1lesson5;
        audioList = audioListsData.course1lesson5;
      }
      break;
      case "Course 03 Introduction": {
        val = courseData.course3Introduction;
        audioList = audioListsData.course3Introduction;
      }
      break;
      case "Course 03 Lesson 01": {
        val = courseData.course3lesson1;
        audioList = audioListsData.course3lesson1;
      }
      break;
      case "Course 03 Lesson 02": {
        val = courseData.course3lesson2;
        audioList = audioListsData.course3lesson2;
      }
      break;
      case "Course 03 Lesson 03": {
        val = courseData.course3lesson3;
        audioList = audioListsData.course3lesson3;
      }
      break;
      case "Course 03 Lesson 04": {
        val = courseData.course3lesson4;
        audioList = audioListsData.course3lesson4;
      }
      break;
      case "Course 03 Lesson 05": {
        val = courseData.course3lesson5;
        audioList = audioListsData.course3lesson5;
      }
      break;
      case "Part 01 Introduction": {
        val = courseData.part1Introduction;
        audioList = audioListsData.part1Introduction;
      }
      break;
      case "Part 01 Lesson 01": {
        val = courseData.part1lesson1;
        audioList = audioListsData.part1lesson1;
      }
      break;
      case "Part 01 Lesson 02": {
        val = courseData.part1lesson2;
        audioList = audioListsData.part1lesson2;
      }
      break;
      case "Part 01 Lesson 03": {
        val = courseData.part1lesson3;
        audioList = audioListsData.part1lesson3;
      }
      break;
      case "Part 01 Lesson 04": {
        val = courseData.part1lesson4;
        audioList = audioListsData.part1lesson4;
      }
      break;
      case "Part 01 Lesson 05": {
        val = courseData.part1lesson5;
        audioList = audioListsData.part1lesson5;
      }
      break;
      case "Part 02 Lesson 01": {
        val = courseData.part2lesson1;
        audioList = audioListsData.part2lesson1;
      }
      break;
      case "Part 02 Lesson 02": {
        val = courseData.part2lesson2;
        audioList = audioListsData.part2lesson2;
      }
      break;
      case "Part 02 Lesson 03": {
        val = courseData.part2lesson3;
        audioList = audioListsData.part2lesson3;
      }
      break;
      case "Part 02 Lesson 04": {
        val = courseData.part2lesson4;
        audioList = audioListsData.part2lesson4;
      }
      break;
      case "Part 02 Lesson 05": {
        val = courseData.part2lesson5;
        audioList = audioListsData.part2lesson5;
      }
      break;
      case "Part 02 Introduction": {
        val = courseData.part2Introduction;
        audioList = audioListsData.part2Introduction;
      }
      break;
      default: {
        audioList = [];
        val='There is No data in this course please restart the app';
      }
      break;
    }
  }

}





