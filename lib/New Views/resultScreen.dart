import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'finalcourselistscreen.dart';

class ResultScreen extends StatefulWidget {
  final int correctAnswer;
  const ResultScreen({super.key, required this.correctAnswer});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ExpansionPanelListExample()));
          }, icon: Icon(Icons.arrow_back_ios_new),),
        backgroundColor: appPrimaryColor,
      ),
      body: WillPopScope(
        onWillPop: () async{
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ExpansionPanelListExample()));
          return false;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width * .5,
                image: AssetImage('assets/logo.png')
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .1,),
            Center(
                child: Text('آپ نے 10 سوالوں مین سے ' + widget.correctAnswer.toString() + ' سوالوں کے جواب سہی دئیے ہیں ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                  textAlign: TextAlign.center,
                ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .3,),
            CustomSlider()
          ],
        ),
      )
    );
  }
  Widget CustomSlider(){
    return Slider(
        value: value,
        min: 0,
        max:100,
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.grey,
        onChanged: (val){
          setState(() {
            value = val;
          });
        },
        );
  }
  double value =60;
}
