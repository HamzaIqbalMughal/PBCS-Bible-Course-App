import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/New%20Views/courseviewscreen.dart';
import 'package:pbcs_bible_course/constants/colors.dart';
class ExpandableBody extends StatefulWidget {
  final List<List<String>> dataList;
  final int courseNo;
  String? courseName;
  ExpandableBody({super.key, required this.dataList, required this.courseNo, this.courseName});

  @override
  State<ExpandableBody> createState() => _ExpandableBodyState();
}

class _ExpandableBodyState extends State<ExpandableBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.dataList[widget.courseNo].length,
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
                            widget.courseName = 'Course 01';
                          }else if(widget.courseNo == 1){
                            widget.courseName = 'Course 02';
                          }else if(widget.courseNo == 2){
                            widget.courseName = 'Course 03';
                          }
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CourseScreen(text: '', title:  widget.courseName!, lessonNo: widget.dataList[widget.courseNo][index])));
                        },
                        leading: Icon(CupertinoIcons.book_solid,color: appPrimaryColor,),
                        title: Text(widget.dataList[widget.courseNo][index]),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .02,)
                ],
              );
            }
        ),
      ]
    );
  }
}
