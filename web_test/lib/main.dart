import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/animation.dart';
import 'package:web_test/screens/about.dart';
import 'dart:async';

import 'package:web_test/screens/certifications.dart';
import 'package:web_test/screens/contact.dart';
import 'package:web_test/screens/projects.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  Timer timer;
  AnimationController _controller;
  AnimationController _controllerB;
  AnimationController _controllerC;
  PageController _pageController;
  Animation _intro;
  Animation _introB;
  DrawerController _dcontroller;
  Animation _introC;
  String role="Android";
  void changeRole() {
    List<String> roles= ["Web","Desktop","Android"];
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        role=(roles..shuffle()).first;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _controller=AnimationController(duration: Duration(milliseconds: 1200),vsync: this);
    _controllerB=AnimationController(duration: Duration(milliseconds: 1300),vsync: this);
    _controllerC=AnimationController(duration: Duration(milliseconds: 1500),vsync: this);
    _intro = Tween<double>(begin: 0.2,end: -0.01).animate(CurvedAnimation(parent: _controller,curve:Curves.easeInOut));
    _introB=Tween<double>(begin: 0.2,end: 0).animate(CurvedAnimation(parent: _controllerB,curve:Curves.easeInOut));
    _introC=Tween<double>(begin: 0.2,end: 0).animate(CurvedAnimation(parent: _controllerC,curve:Curves.easeInOut));
    _controller.forward();
    _controllerB.forward();
    _controllerC.forward();
    //changeRole();
    Future.delayed(Duration(seconds: 2),() {
      changeRole();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",style: GoogleFonts.poppins(),),
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage('https://scontent-del1-1.cdninstagram.com/v/t51.2885-19/s320x320/117375804_170422697875873_904878130222711243_n.jpg?_nc_ht=scontent-del1-1.cdninstagram.com&_nc_ohc=8ZUwUJ8jbUEAX-PA6T7&oh=733f9015bc4630d76b7c5759ce4d4683&oe=5F8A68EE'),
                    radius: 40,
                  ),
                  SizedBox(height: 14,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Anirudh Pratap Singh",style: GoogleFonts.poppins(),),
                      Text("anirudhisgreat1200@gmail.com",style: GoogleFonts.poppins(),),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AboutScreen()
                ));
              },
              hoverColor: Colors.grey[900],
              tileColor: Colors.white,
              leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green)
              )
              ,child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(Icons.person,color: Colors.green,),
              )),
              title: Text("Know More About Me",style: GoogleFonts.poppins(color: Colors.green),),
            ),
            ListTile(
              onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProjectScreen()
                  ));
              },
              hoverColor: Colors.grey[900],
              tileColor: Colors.white,
              leading: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green)
                  )
                  ,child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(Icons.computer,color: Colors.green,),
              )),
              title: Text("Projects",style: GoogleFonts.poppins(color: Colors.green),),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CertScreen()
                ));
              },
              hoverColor: Colors.grey[900],
              tileColor: Colors.white,
              leading: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green)
                  )
                  ,child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(Icons.bookmark,color: Colors.green,),
              )),
              title: Text("Certifications",style: GoogleFonts.poppins(color: Colors.green),),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ContactScreen()
                ));
              },
              hoverColor: Colors.grey[900],
              tileColor: Colors.white,
              leading: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green)
                  )
                  ,child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(Icons.contact_mail,color: Colors.green,),
              )),
              title: Text("Contact Me",style: GoogleFonts.poppins(color: Colors.green),),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1484417894907-623942c8ee29?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken)

            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedBuilder(
                  animation: _controller,
                  builder: (context,child) {
                    return Transform(
                        transform: Matrix4.translationValues(0,_intro.value*width,0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Text("Hi I am Anirudh.",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 50,color: Colors.white),),
                        ));
                  }),
              AnimatedBuilder(
                  animation: _controllerB,
                  builder: (context,child) {
                    return Transform(
                        transform: Matrix4.translationValues(0,_introB.value*width,0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: AnimatedDefaultTextStyle(
                            duration: Duration(milliseconds: 1000),
                              style: GoogleFonts.montserrat(fontSize: 45,color: Colors.white,fontWeight: FontWeight.w500),
                              child: Text("I develop $role applications.",style: GoogleFonts.montserrat(fontSize: 45,color: Colors.white,fontWeight: FontWeight.w500),)),
                        ));
                  }),
              SizedBox(height: 20,),
              AnimatedBuilder(
                  animation: _controllerC,
                  builder: (context,child) {
                    return Transform(
                        transform: Matrix4.translationValues(0,_introC.value*width,0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Container(
                            height: 50,
                            width: 140,
                            child: MaterialButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AboutScreen()
                                ));
                              },
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Know more",style: GoogleFonts.poppins(color: Colors.green,fontWeight: FontWeight.w600),),
                                    Icon(Icons.arrow_forward_ios,color: Colors.green,size: 20,),
                                    //Text("Start",style: GoogleFonts.poppins(color: Colors.green,fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
