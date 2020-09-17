import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uic1/dynamics.dart';

class MainMid extends StatefulWidget {
  @override
  _MainMidState createState() => _MainMidState();
}

class _MainMidState extends State<MainMid> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: closeTopContainer ? 0 : 1,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: closeTopContainer ? 0 : 80,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: ListView(
                primary: true,
                scrollDirection: Axis.horizontal,
                children: [
                  initStoryTag(),
                  StoryTag(
                      image: "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                  StoryTag(
                      image: "https://images.unsplash.com/photo-1503104834685-7205e8607eb9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                  StoryTag(
                      image: "https://images.unsplash.com/photo-1562572159-4efc207f5aff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                  StoryTag(
                      image: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                  StoryTag(
                      image: "https://images.unsplash.com/photo-1527203561188-dae1bc1a417f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeIn,
            margin: EdgeInsets.only(top: 25, left: 10),
            height: closeTopContainer==true?0:60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text("Latest Posts", style: GoogleFonts.poppins(
                      fontSize: 35, fontWeight: FontWeight.w500),),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 1.35,
            child: ListView.builder(
              controller: controller,
              itemCount: 10,
              itemBuilder: (context,i) {
                return Align(
                    child: PostView(index: i)
                );
              },
            )
          ),
        ],
      ),
    );
  }

  Widget StoryTag({image}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      width: 75,
      margin: EdgeInsets.only(right: 10, top: 5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(65),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            )
        ),
      ),
    );
  }

  Widget initStoryTag() {
    Brightness mode=SchedulerBinding.instance.window.platformBrightness;
    return Container(
      decoration: BoxDecoration(
          color: mode==Brightness.dark?Colors.black:Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(65),
          border: Border.all(color: Colors.grey[500], width: 3)
      ),
      width: 75,
      margin: EdgeInsets.only(right: 10, left: 10, top: 5),
      child: Center(
        child: Icon(Icons.add, size: 40,color: mode==Brightness.dark?Colors.white:Colors.black,),
      ),
    );
  }

  Widget PostView({index}) {
    Brightness mode=SchedulerBinding.instance.window.platformBrightness;
    return Container(
      height: 200,
      decoration: BoxDecoration(
        // ignore: unrelated_type_equality_checks
        color:mode==Brightness.light?Color.fromRGBO(18,18,18,1):Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Center(
        child: Text(index.toString(),style: GoogleFonts.poppins(fontSize: 50,color: mode==Brightness.light?Colors.white:Colors.black),),
      ),
    );
  }

}