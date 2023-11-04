import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/constants/colors.dart';

class Option extends StatefulWidget{
  final bool isSelected;
  final String text;
  VoidCallback onTap;
  Option({super.key, required this.text,required this.onTap,required this.isSelected});
  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        height: MediaQuery.of(context).size.height * .12,
        width: MediaQuery.of(context).size.width * .79,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: widget.isSelected? appPrimaryColor : Colors.black,width: 3),
        ),
        child: Center(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(child: Text(widget.text,textAlign: TextAlign.right,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),))),
        ),
      ),
    );
  }
}
