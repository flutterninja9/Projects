import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uic1/dynamics.dart';
import 'package:uic1/screens/mainMid.dart';
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
        primaryColor: Colors.white,
        brightness: Brightness.light,
        primaryColorBrightness: Brightness.light,
        primaryColorDark: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(brightness: Brightness.light),
      ),
      darkTheme: ThemeData(
          primaryColor: Color.fromRGBO(18,18,18,1),
          primaryColorBrightness: Brightness.dark,
          primaryColorLight: Colors.black,
          brightness: Brightness.dark,
          primaryColorDark: Colors.black,
          indicatorColor: Colors.white,
          canvasColor: Color.fromRGBO(18,18,18,1),
          // next line is important!
          appBarTheme: AppBarTheme(brightness: Brightness.dark)
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int currPos=0;


  @override
  Widget build(BuildContext context) {
    Brightness isDark=SchedulerBinding.instance.window.platformBrightness;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:  Text(appTitle,style: GoogleFonts.oleoScriptSwashCaps(fontWeight: FontWeight.w500,fontSize: 22),),
        leading: IconButton(
          onPressed: () {
           print("OK");
          },
          icon: Icon(FeatherIcons.settings),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FeatherIcons.messageSquare),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: currPos,
        onTap: (index) {
          setState(() {
            currPos=index;
          });
        },
        unselectedItemColor: isDark==Brightness.dark?Colors.white:Colors.black,
        items: [
          BottomNavigationBarItem(
            title: currPos==0?AnimatedContainer(
              curve: Curves.easeIn,
              duration: Duration(seconds: 1),
              height: 8,
              width: 8,
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(5)
              ),
            ):Container(),
            icon: Icon(FeatherIcons.home),
            activeIcon: Icon(FeatherIcons.home,color: Colors.pink,),
          ),
          BottomNavigationBarItem(
            title: currPos==1?AnimatedContainer(
              curve: Curves.easeIn,
              duration: Duration(seconds: 1),
              height: 8,
              width: 8,
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(5)
              ),
            ):Container(),
            icon: Icon(FeatherIcons.search),
            activeIcon: Icon(FeatherIcons.search,color: Colors.pink,),
          ),
          BottomNavigationBarItem(
            title: Container(),
            icon: Container(
                padding: EdgeInsets.all(12),
                child: Icon(Icons.add,size: 40,color: isDark==Brightness.dark?Colors.white:Colors.black,)),
            activeIcon: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark==Brightness.dark?Colors.white:Colors.black,
                ),
                child: Icon(Icons.add,size: 40,color: Colors.pink,)),
          ),
          BottomNavigationBarItem(
            title: currPos==3?AnimatedContainer(
              curve: Curves.easeIn,
              duration: Duration(seconds: 1),
              height: 8,
              width: 8,
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(5)
              ),
            ):Container(),
            icon: Icon(FeatherIcons.heart),
            activeIcon: Icon(FeatherIcons.heart,color: Colors.pink,),
          ),
          BottomNavigationBarItem(
            title: currPos==4?AnimatedContainer(
              curve: Curves.easeIn,
              duration: Duration(seconds: 1),
              height: 8,
              width: 8,
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(5)
              ),
            ):Container(),
            icon: Icon(FeatherIcons.settings),
            activeIcon: Icon(FeatherIcons.settings,color: Colors.pink,),
          ),
        ],
      ),
      body: MainMid(),
    );
  }
}
