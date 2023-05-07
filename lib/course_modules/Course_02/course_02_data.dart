import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class CourseInfo{
//   final String title;
//   final String content;
//   CourseInfo({required this.title, required this.content});
// }

class Course_02_data extends StatefulWidget {
  final auth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;
  Course_02_data({super.key});

  @override
  State<Course_02_data> createState() => _Course_02_dataState();
}

class _Course_02_dataState extends State<Course_02_data> {
  final firestore =
      FirebaseFirestore.instance.collection("Courses").snapshots();
  DatabaseReference ref = FirebaseDatabase.instance.ref('/Course_01');
  // final CollectionReference = FirebaseFirestore.instance.collection("Courses");
  // final documentRef =
  //     FirebaseFirestore.instance.collection('Courses').doc('Course_01');
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    'Course_01',
                    style: TextStyle(
                      color: appPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Calibri',
                      fontSize: 35,
                    ),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
                width: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.78,
                child: Column(
                  children: [
                    // Use the get() method to retrieve the document data
                    Expanded(
                      child: SingleChildScrollView(
                        // child: FutureBuilder<
                        //     DocumentSnapshot<Map<String, dynamic>>>(
                        //   future: FirebaseFirestore.instance
                        //       .collection('Courses')
                        //       .doc('Course_01')
                        //       .get(),
                        //   builder: (context, snapshot) {
                        //     if (snapshot.hasData && snapshot.data != null) {
                        //       final documentData = snapshot.data!.data();
                        //       final fieldValue = documentData!['content'];
                        //       return Text(
                        //         fieldValue,
                        //         style: const TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //           fontFamily: 'Gulzar-Regular',
                        //           fontSize: 12,
                        //         ),
                        //         textAlign: TextAlign.right,
                        //         textDirection: TextDirection.rtl,
                        //       );
                        //     } else if (snapshot.hasError) {
                        //       return Text(
                        //           'Error retrieving document: ${snapshot.error}');
                        //     } else {
                        //       return const Text('Loading...');
                        //       // return Center(
                        //       //   child: Column(
                        //       //     mainAxisAlignment: MainAxisAlignment.center,
                        //       //     crossAxisAlignment: CrossAxisAlignment.center,
                        //       //     children: const [
                        //       //       CircularProgressIndicator(),
                        //       //     ],
                        //       //   ),
                        //       // );
                        //     }
                        //   },
                        // ),

                        child: StreamBuilder<
                            DocumentSnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection('Courses')
                              .doc('Course_01')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              final documentData = snapshot.data!.data();
                              final fieldValue = documentData!['content'];
                              return Text(
                                fieldValue,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Gulzar-Regular',
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                              );
                            } else if (snapshot.hasError) {
                              return Text(
                                'Error retrieving document: ${snapshot.error}',
                              );
                            } else {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text("Loading..."),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                        // child: FutureBuilder<
                        //     DocumentSnapshot<Map<String, dynamic>>>(
                        //   future: FirebaseFirestore.instance
                        //       .collection('Courses')
                        //       .doc('Course_01')
                        //       .get(),
                        //   builder: (context, snapshot) {
                        //     if (snapshot.hasData && snapshot.data != null) {
                        //       final documentData = snapshot.data!.data();
                        //       final fieldValue = documentData!['content'];
                        //       _data = fieldValue;
                        //       return Container();

                        //       // style: const TextStyle(
                        //       //   fontWeight: FontWeight.bold,
                        //       //   fontFamily: 'Gulzar-Regular',
                        //       //   fontSize: 12,
                        //       // ),
                        //       // textAlign: TextAlign.right,
                        //       // textDirection: TextDirection.rtl,
                        //     } else if (snapshot.hasError) {
                        //       return Text(
                        //           'Error retrieving document: ${snapshot.error}');
                        //     } else {
                        //       return const Text("Loading...");
                        //     }
                        //   },
                        // ),
                      ),
                    ),

                    // Expanded(
                    //   child: SingleChildScrollView(
                    //     child: Text(_data),
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}