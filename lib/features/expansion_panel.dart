// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:pbcs_bible_course/constants/colors.dart';
// import 'package:pbcs_bible_course/provider/font_size_provider.dart';
// import 'package:pdf_text/pdf_text.dart';
// import 'package:provider/provider.dart';

// class ExpansionPanelDemo extends StatefulWidget {
//   final String pdfUrl =
//       "https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/courses%2Fcourse_01%2FTLPP%20Text%20only%20Unicode%20complete.pdf?alt=media&token=34b78844-4a7b-4d37-9330-7691be96a41d";

//   const ExpansionPanelDemo({Key? key}) : super(key: key);

//   @override
//   _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
// }

// class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
//   List<Item> _books = generateItems(1);
//   String _docText = '';
//   bool _isLoading = true;
//   late double _fontSize;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   String formattedText = "";

//   @override
//   void initState() {
//     fetchFormattedText();
//     super.initState();
//   }

//   Future<void> fetchFormattedText() async {
//     final FirebaseFirestore firestore = FirebaseFirestore.instance;
//     final DocumentSnapshot snapshot =
//         await firestore.collection('Course01').doc('Lesson01').get();

//     if (snapshot.exists) {
//       formattedText = snapshot['content'];
//       setState(() {
//         _isLoading = false;
//       });
//     } else {
//       formattedText = 'Error in loading the text';
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     _fontSize = Provider.of<FontSizeProvider>(context).fontSize;
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.arrow_back_ios_new),
//         title: const Text('Courses'),
//         backgroundColor: appPrimaryColor,
//         actions: [
//           GestureDetector(
//             onTap: () => _fontSizeModelBottomSheet(context),
//             child: const Padding(
//               padding: EdgeInsets.only(right: 10),
//               child: Icon(
//                 Icons.more_vert,
//                 size: 28,
//               ),
//             ),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.only(top: 80),
//           child: _buildPanel(),
//         ),
//       ),
//     );
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _books[index].isExpanded = !isExpanded;
//         });
//       },
//       children: _books.map<ExpansionPanel>((Item item) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return const ListTile(
//               title: Text(
//                 "Course 01",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Gulzar-Regular',
//                   fontSize: 16,
//                 ),
//               ),
//             );
//           },
//           body: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
//             child:
//                 //  _isLoading
//                 //     ? const CircularProgressIndicator()
//                 //     :
//                 Expanded(
//               child: Directionality(
//                 textDirection: TextDirection.rtl,
//                 child: SingleChildScrollView(
//                   child: Text(
//                     formattedText,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Gulzar-Regular',
//                       fontSize: _fontSize,
//                     ),
//                     textAlign: TextAlign.right,
//                     textDirection: TextDirection.ltr,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           isExpanded: item.isExpanded,
//         );
//       }).toList(),
//     );
//   }

//   void _fontSizeModelBottomSheet(BuildContext context) {
//     double fontSize =
//         Provider.of<FontSizeProvider>(context, listen: false).fontSize;

//     showModalBottomSheet<void>(
//       isScrollControlled: true,
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(24),
//           topRight: Radius.circular(24),
//         ),
//       ),
//       builder: (context) => StatefulBuilder(
//         builder: (context, setState) => ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(24),
//             topRight: Radius.circular(24),
//           ),
//           child: SingleChildScrollView(
//             child: Container(
//               height: 600,
//               color: Color(0xF2F5F9FF),
//               child: ListView(
//                 shrinkWrap: true,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Change font size',
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: Color(0xFF272D37),
//                           fontSize: 20,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: const Icon(
//                           Icons.close_outlined,
//                           size: 24,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                   Container(
//                     margin: const EdgeInsets.only(left: 45),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 10),
//                     clipBehavior: Clip.antiAlias,
//                     decoration: ShapeDecoration(
//                       color: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: LayoutBuilder(
//                       builder: (context, constraints) {
//                         return Text(
//                           "ہم خط و کتابت کورس ”خُدا کی وفاداری : حصہ اوّل“ آپ کی خدمت میں پیش کرتے ہوئے بہت زیادہ خوشی محسوس کر رہے ہیں۔اُمید ہے کہ اِس کے مطالعہ سے آپ کو بہت زیادہ برکت ملے گی۔",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'Gulzar-Regular',
//                             fontSize: fontSize,
//                             color: Colors.black,
//                           ),
//                           textAlign: TextAlign.right,
//                           textDirection: TextDirection.rtl,
//                         );
//                       },
//                     ),
//                   ),

//                   SizedBox(height: 24),
//                   Positioned(
//                     bottom: 10,
//                     child: Container(
//                       child: Slider(
//                         thumbColor: appPrimaryColor,
//                         activeColor: appPrimaryColor,
//                         value: fontSize,
//                         min: 14.0,
//                         max: 18.0,
//                         onChanged: (newValue) {
//                           setState(() {
//                             fontSize = newValue;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   // SizedBox(height: 24),
//                   Container(
//                     margin: const EdgeInsets.only(bottom: 0),
//                     width: 327,
//                     height: 56,
//                     decoration: ShapeDecoration(
//                       color: appPrimaryColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(100),
//                       ),
//                     ),
//                     child: TextButton(
//                       onPressed: () {
//                         // set font size saved provider here
//                         Provider.of<FontSizeProvider>(context, listen: false)
//                             .fontSize = fontSize;
//                         // Navigator.pop(context);
//                       },
//                       child: const Center(
//                         child: Text(
//                           'Save Changes',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // stores ExpansionPanel state information
// class Item {
//   Item({
//     required this.expandedValue,
//     required this.headerValue,
//     this.isExpanded = false,
//   });

//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
// }

// List<Item> generateItems(int numberOfItems) {
//   return List.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: 'Book $index',
//       expandedValue: 'Details for Book $index goes here',
//     );
//   });
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../provider/font_size_provider.dart';

class ExpansionPanelDemo extends StatefulWidget {
  const ExpansionPanelDemo({Key? key}) : super(key: key);

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<Item> _books = generateItems(1);
  String _docText = '';
  bool _isLoading = true;
  late double _fontSize;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<String> formattedTextList = [];
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void initState() {
    fetchFormattedText();
    super.initState();
  }

  Future<void> fetchFormattedText() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final DocumentSnapshot snapshot =
          await firestore.collection('Course01').doc('Lesson01').get();

      if (snapshot.exists) {
        formattedTextList.add(snapshot['content']);
        await saveFormattedTextToDatabase(snapshot['content']);
      } else {
        formattedTextList.add('Error in loading the text');
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching formatted text: $e');
      setState(() {
        _isLoading = false;
        formattedTextList.add('Error in loading the text');
      });
    }
  }

  Future<void> saveFormattedTextToDatabase(String text) async {
    try {
      await DatabaseHelper.insertFormattedText(text);
      print("Formatted text saved to database.");
    } catch (e) {
      print('Error saving formatted text: $e');
    }
  }

  Future<void> fetchFormattedTextFromDatabase(int limit, int offset) async {
    try {
      final List<String> texts =
          await DatabaseHelper.getFormattedTexts(limit, offset);
      formattedTextList = texts;
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching formatted text: $e');
      setState(() {
        _isLoading = false;
        formattedTextList = ['Error in loading the text'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // _fontSize = 16.0; // Replace with the actual font size
    _fontSize = Provider.of<FontSizeProvider>(context).fontSize;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),
        title: const Text('Courses'),
        backgroundColor: Colors.blue, // Replace with your color
        actions: [
          GestureDetector(
            onTap: () => _fontSizeModelBottomSheet(context),
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.more_vert,
                size: 28,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 80),
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _books[index].isExpanded = !isExpanded;
        });
      },
      children: _books.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const ListTile(
              title: Text(
                "Course 01",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gulzar-Regular',
                  fontSize: 16,
                ),
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Text(
                  formattedTextList[item.index], // Use index to access text
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gulzar-Regular',
                    fontSize: _fontSize,
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  void _fontSizeModelBottomSheet(BuildContext context) {
//     double fontSize = 16.0; // Replace with the actual font size
    double fontSize =
        Provider.of<FontSizeProvider>(context, listen: false).fontSize;

    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              color: Color(0xF2F5F9FF),
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Change font size',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF272D37),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close_outlined,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    margin: const EdgeInsets.only(left: 45),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Text(
                          "ہم خط و کتابت کورس ”خُدا کی وفاداری : حصہ اوّل“ آپ کی خدمت میں پیش کرتے ہوئے بہت زیادہ خوشی محسوس کر رہے ہیں۔اُمید ہے کہ اِس کے مطالعہ سے آپ کو بہت زیادہ برکت ملے گی۔",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gulzar-Regular',
                            fontSize: fontSize,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 24),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      child: Slider(
                        thumbColor: Colors.blue, // Replace with your color
                        activeColor: Colors.blue, // Replace with your color
                        value: fontSize,
                        min: 14.0,
                        max: 18.0,
                        onChanged: (newValue) {
                          setState(() {
                            fontSize = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                  // SizedBox(height: 24),
                  Container(
                    margin: const EdgeInsets.only(bottom: 0),
                    width: 327,
                    height: 56,
                    decoration: ShapeDecoration(
                      color: Colors.blue, // Replace with your color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // set font size saved provider here
                        Provider.of<FontSizeProvider>(context, listen: false)
                            .fontSize = fontSize;
                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text(
                          'Save Changes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
    required this.index,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
  int index;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Book $index',
      expandedValue: 'Details for Book $index goes here',
      index: index,
    );
  });
}

class DatabaseHelper {
  static Future<Database> get database async {
    final String path = join(await getDatabasesPath(), 'formatted_text.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE formatted_texts(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            text TEXT
          )
        ''');
      },
    );
  }

  static Future<void> insertFormattedText(String text) async {
    final Database db = await database;
    await db.insert('formatted_texts', {'text': text});
  }

  static Future<List<String>> getFormattedTexts(int limit, int offset) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'formatted_texts',
      limit: limit,
      offset: offset,
    );
    return List.generate(maps.length, (i) {
      return maps[i]['text'];
    });
  }
}
