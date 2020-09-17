import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;

class ProjectScreen extends StatefulWidget {
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 243, 242,1),
      appBar: AppBar(
        elevation: 1,
        title: Text("Projects",style: GoogleFonts.poppins(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 18,top: 20),
          child: Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment:WrapCrossAlignment.center,
            children: [
              project(name: "Craftly",started: "01-2020",finished: "05-2020"),
              project(name: "Face-Detection Attendence System",started: "03-2018",finished: "08-2018"),
              project(name: "E-Commerce Store REST API",started: "03-2020",finished: "05-2020"),
              project(name: "Farmica",started: "01-2020",finished: "02-2020"),
              project(name: "Tap Monitor",started: "04-2020",finished: "04-2020"),
              project(name: "Sentiment Analyser",started: "03-2019",finished: "06-2019"),
              project(name: "BlogLy",started: "04-2020",finished: "04-2020"),
            ],
          ),
        ),
      ),
    );
  }

  Widget project({name,started,finished,link}) {
    return Container(
      height: 200,
      width: 200,
      margin: EdgeInsets.only(right: 18,bottom: 10),
      padding: EdgeInsets.only(left: 18,right: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Color.fromRGBO(123, 50, 168,1),
            Color.fromRGBO(158, 50, 168,1),
          ],
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Started : ",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500),),
              Text(started,style: GoogleFonts.poppins(color: Colors.white),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Finished : ",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500),),
              Text(finished,style: GoogleFonts.poppins(color: Colors.white),),
            ],
          ),
        ],
      ),
    );
  }

}
