import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
        primarySwatch: Colors.pink,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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

  PageController _controller=PageController();
  int currPage=0;
  bool isDark=false;
  bool isActive=false;


  void switchDark() {
    setState(() {
      isDark=true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.animateToPage(currPage+1, duration: Duration(seconds: 1), curve: Curves.fastLinearToSlowEaseIn);
        },
        child: Icon(Icons.add,size: 30,),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(Icons.library_add),
              Icon(Icons.next_week),
              Icon(Icons.bookmark),
              Icon(Icons.person),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              controller: _controller,
              onPageChanged: (page) {
                setState(() {
                  currPage=page;
                });
              },
              children: [
                Container(child: Center(child: Text(currPage.toString())),),
                Container(child: Center(child: Text(currPage.toString())),),
                Container(child: Center(child: Text(currPage.toString())),),
                Container(child: Center(child: Text(currPage.toString())),),
                Container(child: Center(child: Text(currPage.toString())),),
                Container(child: Center(child: Text(currPage.toString())),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text("Follow",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey[500]),),
                        ),
                        SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text("For You",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 22),),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height/3,
              left: MediaQuery.of(context).size.width-60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage('https://timesofindia.indiatimes.com/thumb/msid-71970885,width-1200,height-900,resizemode-4/.jpg'),
                    radius: 25,
                  ),
                  SizedBox(height: 25,),
                  Icon(Icons.favorite,size: 45,color: Colors.red,),
                  SizedBox(height: 25,),
                  Icon(Icons.comment,size: 45),
                  SizedBox(height: 25,),
                  Icon(Icons.share,size: 45),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
