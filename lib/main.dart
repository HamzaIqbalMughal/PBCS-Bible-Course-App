// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pbcs_bible_course/features/display_formated_text.dart';
// import 'package:pbcs_bible_course/features/get_started_screen/dashboard.dart';
// import 'package:pbcs_bible_course/features/expansion_panel.dart';
// // import 'package:pbcs_bible_course/features/display_formated_text.dart';
// import 'package:pbcs_bible_course/features/upload_data.dart';
// import 'features/get_started_screen/first_screen.dart';
// import 'package:firebase_core/firebase_core.dart';

// // void main() {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   Firebase.initializeApp();
// //   runApp(const MyApp());
// //   // WidgetsFlutterBinding.ensureInitialized();
// //   // Firebase.initializeApp();
// //   // lock the landscape mode...
// //   // SystemChrome.setPreferredOrientations([
// //   //   DeviceOrientation.portraitUp,
// //   //   DeviceOrientation.portraitDown,
// //   // ]).then(
// //   //   (_) {
// //   //     // Firebase.initializeApp();

// //   //   },
// //   // );
// // }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]).then((_) {
//     Firebase.initializeApp();
//     runApp(const MyApp());
//   });
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return OrientationBuilder(
//       builder: (context, orientation) {
//         SystemChrome.setPreferredOrientations([
//           DeviceOrientation.portraitUp,
//           DeviceOrientation.portraitDown,
//         ]);

import 'package:firebase_core/firebase_core.dart';
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//           ),
//           home: ExpansionPanelDemo(),
//           // home: const SignUpScreen(),
//           // home: LoginScreen(),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbcs_bible_course/New%20Views/finalcourselistscreen.dart';
import 'package:pbcs_bible_course/New%20Views/sliderprovider.dart';
import 'package:pbcs_bible_course/features/get_started_screen/login_screen.dart';
import 'package:pbcs_bible_course/features/get_started_screen/splash_screen.dart';
import 'package:pbcs_bible_course/provider/font_size_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    runApp(const MyApp()
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => SliderProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ExpansionPanelListExample(),
      home: SplashScreen(),
      // Add other routes as needed
    ),);
  }
}


// Add other widgets and classes as needed
