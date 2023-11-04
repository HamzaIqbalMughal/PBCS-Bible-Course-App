import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/New%20Views/course2_exoansion_panel.dart';
import 'package:pbcs_bible_course/New%20Views/expandedbody.dart';
import 'package:pbcs_bible_course/constants/colors.dart';

class ExpansionPanelListExample extends StatefulWidget {
  const ExpansionPanelListExample({Key? key}) : super(key: key);

  @override
  State<ExpansionPanelListExample> createState() =>
      _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  List<List<String>> dataList = [
    ['Introduction', 'Lesson 01', 'Lesson 02', 'Lesson 03', 'Lesson 04', 'Lesson 05'],
    ['empty'],
    ['Introduction', 'Lesson 01', 'Lesson 02', 'Lesson 03', 'Lesson 04', 'Lesson 05']
  ];
  int courseNo = 0;
  final refDB = FirebaseDatabase.instance.ref('courses');
  final List<Item> _data = generateItems(3);
  String courseName = '';
  int expandedPanelIndex = -1; // Initialize with -1 to indicate no panel is expanded.

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Courses'),
        backgroundColor: appPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _decision() {
    if (courseNo == 1) {
      return Course2ExpansionPanel(courseNo: courseNo, courseName: courseName);
    }
    return ExpandableBody(dataList: dataList, courseNo: courseNo, courseName: courseName);
  }

  Widget _buildPanel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ExpansionPanelList(
        elevation: 1,
        expandedHeaderPadding: const EdgeInsets.all(0),
        expansionCallback: (int pIndex, bool isExpanded) {
          setState(() {
            if (isExpanded) {
              // Close the currently expanded panel.
              expandedPanelIndex = -1;
            } else {
              courseNo = pIndex;
              expandedPanelIndex = pIndex;
            }
          });
        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.headerValue, style: const TextStyle(fontSize: 18)),
                contentPadding: const EdgeInsets.all(10),
              );
            },
            body: _decision(),
            isExpanded: expandedPanelIndex == _data.indexOf(item),
          );
        }).toList(),
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false, // Initially, panels are collapsed.
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Course ${index + 1}',
      expandedValue: '',
    );
  });
}
