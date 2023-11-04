import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/New%20Views/courseviewscreen.dart';
import 'package:pbcs_bible_course/constants/colors.dart';
class Course2ExpansionPanel extends StatefulWidget {
   int courseNo = 0;
  String? courseName;
  Course2ExpansionPanel({super.key, required this.courseNo,this.courseName});

  @override
  State<Course2ExpansionPanel> createState() => _Course2ExpansionPanelState();
}

class _Course2ExpansionPanelState extends State<Course2ExpansionPanel> {
  final List<Item> _data = generateItems(2);
  List<List<String>> dataList = [
    ['Introduction','Lesson 01','Lesson 02','Lesson 03','Lesson 04','Lesson 05'],
    ['Introduction','Lesson 01','Lesson 02','Lesson 03','Lesson 04','Lesson 05']
  ];
  @override
  Widget build(BuildContext context) {
    return _buildPanel();
  }
  Widget _buildPanel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ExpansionPanelList(
        expansionCallback: (int pIndex, bool isExpanded) {
          setState(() {
            _data[pIndex].isExpanded = isExpanded;
            widget.courseNo = pIndex;
          });
        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: ListTile(
                  title: Text(item.headerValue,style: const TextStyle(fontSize: 18),),
                  contentPadding: const EdgeInsets.only(bottom: 5,top: 15,left: 15,right: 15),
                ),
              );
            },
            body: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: dataList[widget.courseNo].length,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: greyColor,
                                      offset: const Offset(
                                        2.0,
                                        6.0,
                                      ),
                                      blurRadius: 2.0,
                                      spreadRadius: 1.0,
                                    ), //BoxShadow
                                    const BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.0, 0.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    ),
                                  ]
                              ),
                              child: ListTile(
                                onTap:(){
                                  if(widget.courseNo == 0){
                                    widget.courseName = 'Part 01';
                                  }else if(widget.courseNo == 1){
                                    widget.courseName = 'Part 02';
                                  }
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => CourseScreen(
                                          text: '', title:  widget.courseName!,
                                          lessonNo: dataList[widget.courseNo][index])
                                      ));
                                },
                                leading: Icon(CupertinoIcons.book_solid,color: appPrimaryColor,),
                                title: Text(dataList[widget.courseNo][index]),
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * .02,)
                        ],
                      );
                    }
                ),
              ],
            ),
            isExpanded: !item.isExpanded,
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
    this.isExpanded = true,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Part 0${index+1}',
      expandedValue: '',
    );
  });
}
