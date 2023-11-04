import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/features/get_started_screen/login_screen.dart';
import 'package:pbcs_bible_course/utils/utils.dart';
import '../../constants/colors.dart';
import '../New Views/expansion_panel.dart';
import 'Course_01/course_01.dart';
import 'Course_01/course_01_data.dart';
import 'Course_02/course_02.dart';
import 'Course_03/course_03.dart';
import 'Course_03/course_03_data.dart';

class CoursesScreen extends StatelessWidget {
  CoursesScreen({super.key});

  final auth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref('/Course_01');
  //  final snapshot = await ref.child('Post').get();

  // ignore: prefer_typing_uninitialized_variables
  var event;
  var username;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: mediaQuery.size.width * 0.9,
          height: mediaQuery.size.height * 0.95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: mediaQuery.size.width * 0.15,
                  ),
                  const SizedBox(width: 20),
                  // Expanded(
                  Text(
                    'Courses',
                    style: TextStyle(
                      color: appPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Calibri',
                      fontSize: 35,
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                  ),

                  const SizedBox(
                    width: 12,
                  ),
                  IconButton(
                    onPressed: () {
                      auth.signOut().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      }).onError((error, stackTrace) {
                        Utils().toastMessage(error.toString());
                      });

                      // fetchData();
                    },
                    icon: const Icon(Icons.login_outlined),
                    iconSize: 30.0,
                    color: appPrimaryColor,
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  width: mediaQuery.size.width * 0.9,
                  height: mediaQuery.size.height * 0.15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: tSecondaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: tSecondaryColor,
                        spreadRadius: 5,
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text('Hello'),
                      Course01(),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewCourseScreen(),
                    ),
                  );
                },
              ),
              // child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       // Text('Hello'),
              //       Course01(),
              //     ],
              //   ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20.0),
                width: mediaQuery.size.width * 0.9,
                height: mediaQuery.size.height * 0.15,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: tSecondaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: tSecondaryColor,
                      spreadRadius: 5,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Course_02(),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  width: mediaQuery.size.width * 0.9,
                  height: mediaQuery.size.height * 0.15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: tSecondaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: tSecondaryColor,
                        spreadRadius: 5,
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text('Hello'),
                      Course03(),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Course_03_data(),
                    ),
                  );
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
