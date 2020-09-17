import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'dart:js' as js;

class CertScreen extends StatefulWidget {
  @override
  _CertScreenState createState() => _CertScreenState();
}

class _CertScreenState extends State<CertScreen> {
  List<String> certCompany=["L.A Brewery","Microsoft","IIT BHU"];
  List<String> certs=["Flutter","Python","College Ambassador"];
  List<String> issOn=["01-2020","04-2018","07-2018"];
  List<String> links=["https://drive.google.com/file/d/15xtkZUksuAmutgmdm_vyAgGNEZC7ajEy/view?usp=sharing","https://drive.google.com/file/d/16OZsg7zcXSZMu3ASId6t98mJT_dwggf-/view?usp=drivesdk","https://drive.google.com/file/d/1wC-gViYhdMvCwLB-uHmhdXpW0-8fnVoB/view?usp=sharing"];
  List<String> bgs=["https://www.inovex.de/blog/wp-content/uploads/2019/01/Flutter-1-1.png","https://pbs.twimg.com/media/Dd_k9f0V4AIrAGw.png","https://images.collegedunia.com/public/college_data/images/campusimage/149803950414335885171433227076Capture.JPG"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 243, 242,1),
      appBar: AppBar(
        elevation: 1,
        title: Text("Certifications",style: GoogleFonts.poppins(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 18,top: 20),
          child: Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment:WrapCrossAlignment.center,
            children: [
              project(name: certs[0],started: certCompany[0],finished: issOn[0],link: links[0]),
              project(name: certs[1],started: certCompany[1],finished: issOn[1],link: links[1]),
              project(name: certs[2],started: certCompany[2],finished: issOn[2],link: links[2]),
            ],
          ),
        ),
      ),
    );
  }

  Widget project({name,started,finished,link}) {
    return InkWell(
      onTap: () {
        js.context.callMethod("open", [link]);
      },
      child: Container(
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
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Issued By : ",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500),),
                  Flexible(child: Text(started,overflow: TextOverflow.clip,style: GoogleFonts.poppins(color: Colors.white),)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Issued On : ",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500),),
                Text(finished,style: GoogleFonts.poppins(color: Colors.white),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
