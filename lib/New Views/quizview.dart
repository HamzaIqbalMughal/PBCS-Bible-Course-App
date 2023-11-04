import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/New%20Views/optioncomponent.dart';
import 'package:pbcs_bible_course/New%20Views/resultScreen.dart';
import 'package:pbcs_bible_course/constants/colors.dart';

import 'audiolists.dart';
import 'finalcourselistscreen.dart';

class QuizScreen extends StatefulWidget {
  final String courseName;
  final String lessonName;
  const QuizScreen(
      {super.key, required this.courseName, required this.lessonName});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  AudioListsAndQuestionsList qData = AudioListsAndQuestionsList();
  List<List<String>> questionData = [];
  List<int> answers = [];
  int iterCounter = 0;
  bool isLastQuestion = false;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  int correctAnswer=0;
  @override
  void initState() {
    // TODO: implement initState
    initializeQuestionData();
    correctAnswer = 0;
    iterCounter=0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            iterCounter = 0;
            correctAnswer = 0;
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ExpansionPanelListExample()));
          },
         ),
        backgroundColor: appPrimaryColor,
        title: Text("Question ${iterCounter + 1} / ${questionData.length}"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              questionData[iterCounter][0],
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          Center(
            child: Column(
              children: [
                Option(
                  text: questionData[iterCounter][1],
                  onTap: () {
                    isSelected1 = true;
                    isSelected2 = false;
                    isSelected3 = false;
                    isSelected4 = false;
                    setState(() {});
                  },
                  isSelected: isSelected1,
                ),
                Option(
                  text: questionData[iterCounter][2],
                  onTap: () {
                    isSelected1 = false;
                    isSelected2 = true;
                    isSelected3 = false;
                    isSelected4 = false;
                    setState(() {});
                  },
                  isSelected: isSelected2,
                ),
                Option(
                  text: questionData[iterCounter][3],
                  onTap: () {
                    isSelected1 = false;
                    isSelected2 = false;
                    isSelected3 = true;
                    isSelected4 = false;
                    setState(() {});
                  },
                  isSelected: isSelected3,
                ),
                InkWell(
                  onTap: () {
                    checkAnswer();
                    setState(() {
                      if (iterCounter == questionData.length - 1) {
                        iterCounter = 0;
                        isSelected1 = false;
                        isSelected2 = false;
                        isSelected3 = false;
                        isSelected4 = false;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(correctAnswer: correctAnswer,)
                            )
                        );
                      } else if (iterCounter == questionData.length - 2) {
                        isLastQuestion = true;
                        iterCounter++;
                        isSelected1 = false;
                        isSelected2 = false;
                        isSelected3 = false;
                        isSelected4 = false;
                      } else {
                        iterCounter++;
                        isSelected1 = false;
                        isSelected2 = false;
                        isSelected3 = false;
                        isSelected4 = false;
                      }
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 35),
                    height: MediaQuery.of(context).size.height * .065,
                    width: MediaQuery.of(context).size.width * .7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: appPrimaryColor),
                    child: Center(
                      child: Text(
                        isLastQuestion ? 'Submit' : 'Next',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .15,
          ),
        ],
      )),
    );
  }
  void checkAnswer(){
    if(isSelected1){
      if(answers[iterCounter]==1){
        correctAnswer++;
      }
    }else if(isSelected2){
      if(answers[iterCounter]==2){
        correctAnswer++;
      }
    }else if(isSelected3){
      if(answers[iterCounter]==3){
        correctAnswer++;
      }
    }
  }
  void initializeQuestionData() async {
    String x = "${widget.courseName} ${widget.lessonName}";
    switch (x) {
      case "Course 01 Lesson 01":
        {
          questionData = qData.course1lesson1Q;
          answers = qData.course1lesson1Answers;
        }
        break;
      case "Course 01 Lesson 02":
        {
          questionData = qData.course1lesson2Q;
          answers = qData.course1lesson2Answers;
        }
        break;
      case "Course 01 Lesson 03":
        {
          questionData = qData.course1lesson3Q;
          answers = qData.course1lesson3Answers;
        }
        break;
      case "Course 01 Lesson 04":
        {
          questionData = qData.course1lesson4Q;
          answers = qData.course1lesson4Answers;
        }
        break;
      case "Course 01 Lesson 05":
        {
          questionData = qData.course1lesson5Q;
          answers = qData.course1lesson5Answers;
        }
        break;
      case "Course 03 Lesson 01":
        {
          questionData = qData.course3lesson1Q;
          answers = qData.course3lesson1Answers;
        }
        break;
      case "Course 03 Lesson 02":
        {
          questionData = qData.course3lesson2Q;
          answers = qData.course3lesson2Answers;
        }
        break;
      case "Course 03 Lesson 03":
        {
          questionData = qData.course3lesson3Q;
          answers = qData.course3lesson3Answers;
        }
        break;
      case "Course 03 Lesson 04":
        {
          questionData = qData.course3lesson4Q;
          answers = qData.course3lesson4Answers;
        }
        break;
      case "Course 03 Lesson 05":
        {
          questionData = qData.course3lesson5Q;
          answers = qData.course3lesson5Answers;
        }
        break;
      case "Part 01 Lesson 01":
        {
          questionData = qData.part1lesson1Q;
          answers = qData.part1lesson1Answers;
        }
        break;
      case "Part 01 Lesson 02":
        {
          questionData = qData.part1lesson2Q;
          answers = qData.part1lesson2Answers;
        }
        break;
      case "Part 01 Lesson 03":
        {
          questionData = qData.part1lesson3Q;
          answers = qData.part1lesson3Answers;
        }
        break;
      case "Part 01 Lesson 04":
        {
          questionData = qData.part1lesson4Q;
          answers = qData.part1lesson4Answers;
        }
        break;
      case "Part 01 Lesson 05":
        {
          questionData = qData.part1lesson5Q;
          answers = qData.part1lesson5Answers;
        }
        break;
      case "Part 02 Lesson 01":
        {
          questionData = qData.part2lesson1Q;
          answers = qData.part2lesson1Answers;
        }
        break;
      case "Part 02 Lesson 02":
        {
          questionData = qData.part2lesson2Q;
          answers = qData.part2lesson2Answers;
        }
        break;
      case "Part 02 Lesson 03":
        {
          questionData = qData.part2lesson3Q;
          answers = qData.part2lesson3Answers;
        }
        break;
      case "Part 02 Lesson 04":
        {
          questionData = qData.part2lesson4Q;
          answers = qData.part2lesson4Answers;
        }
        break;
      case "Part 02 Lesson 05":
        {
          questionData = qData.part2lesson5Q;
          answers = qData.part2lesson5Answers;
        }
        break;
        break;
      default:
        {
          questionData = [];
          answers = [];
        }
        break;
    }
  }
}
