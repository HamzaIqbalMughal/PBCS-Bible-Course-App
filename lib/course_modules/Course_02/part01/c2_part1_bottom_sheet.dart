import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/course_modules/Course_02/part01/lessons_audio/course_02__lesson1_audio.dart';

import '../../../constants/colors.dart';
import 'lessons_audio/Course02Taurf.dart';
import 'lessons_audio/course_02_lesson2_audio.dart';
import 'lessons_audio/course_02_lesson3_audio.dart';
import 'lessons_audio/course_02_lesson4_audio.dart';
import 'lessons_audio/course_02_lesson5_audio.dart';
import 'lessons_audio/course_02_sabaq_ka_khulasa.dart';

class Course02Part01ModelBottomSheet extends StatefulWidget {
  const Course02Part01ModelBottomSheet({super.key});

  @override
  State<Course02Part01ModelBottomSheet> createState() =>
      _Course02Part01ModelBottomSheetState();
}

class _Course02Part01ModelBottomSheetState
    extends State<Course02Part01ModelBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
            useSafeArea: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            builder: (context) => Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            builder: (context) => Container(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: const Course02Part01Taurf(),
                              // child: const Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [Text('Audio Files here...')],
                              // ),
                            ),
                          ).whenComplete(() {

                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appPrimaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 2),
                        child: const Text("Course Taurf"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            builder: (context) => Container(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: const Course02Part01Lesson01Audio(),
                              // child: const Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [Text('Audio Files here...')],
                              // ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appPrimaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 2),
                        child: const Text("Lesson 01"),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            builder: (context) => Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 30, 0, 30),
                                child: const Course02Part01Lesson02Audio()
                                // child: const Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [Text('Audio Files here...')],
                                // ),
                                ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appPrimaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 2),
                        child: const Text("Lesson 02"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            builder: (context) => Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 30, 0, 30),
                                child: const Course02Part01Lesson03Audio()
                                // child: const Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [Text('Audio Files here...')],
                                // ),
                                ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appPrimaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 2),
                        child: const Text("Lesson 03"),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            builder: (context) => Container(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: const Course02Part01Lesson04Audio(),
                              // child: const Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [Text('Audio Files here...')],
                              // ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appPrimaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 2),
                        child: const Text("Lesson 04"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            builder: (context) => Container(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: const Course02Part01Lesson05Audio(),
                              // child: const Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [Text('Audio Files here...')],
                              // ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appPrimaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 2),
                        child: const Text("Lesson 05"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            builder: (context) => Container(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: const Course02Part01SabakKaKhulasa(),
                              // child: const Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [Text('Audio Files here...')],
                              // ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appPrimaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 2),
                        child: const Text("Sabaq ka khulasa"),
                      ),
                    ],
                  ),
                ));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: appPrimaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: const Text('Listen in Audio'),
    );
  }
}
