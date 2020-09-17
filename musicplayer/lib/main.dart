import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import "package:just_audio/just_audio.dart";

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  darkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColorBrightness: Brightness.dark,
    canvasColor: Color.fromRGBO(18, 18,18,1),
    accentColor: Colors.white
  ),
  theme: ThemeData(
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    canvasColor: Colors.white,
    primarySwatch: Colors.purple,
    accentColor: Colors.green,
    primaryColor: Colors.white
  ),
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List songs;

  final player=AudioPlayer();
  var modelHeight=80.0;
  Duration duration=Duration(seconds: 1);
  var currentPos=0.0;
  String currentSong="Play Something";


  Future<void> getSongs() async {
    String url="http://anirudh1998.pythonanywhere.com/spotify/songs/";
    Response response = await get(url);
    List result = jsonDecode(response.body);
    setState(() {
      songs=result;
    });
  }

  @override
  void initState() {
    super.initState();
    getSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 80,
        child: FloatingActionButton(
          onPressed: () async{
            await player.seek(player.position+Duration(seconds: 10));
          },
          child: Icon(Icons.forward_10,size: 35,),
        ),
      ),
      bottomSheet:BottomSheet(
        builder: (context) => Container(
          height: modelHeight,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(currentSong,style: GoogleFonts.montserrat(fontSize: 18),),
                  ],
                ),
                Slider(
                  max: player.duration==null?0.5: player.duration.inSeconds+0.05,
                  min: 0,
                  activeColor: Colors.white,
                  inactiveColor: Colors.black,
                  value: currentPos,
                  onChanged: (val) {
                    setState(() {
                      currentPos=val;
                      int mil=int.parse((val*100).toString().substring(0,3));
                      player.seek(Duration(milliseconds: mil));
                      print(mil);
                    });
                  },
                ),
              ],
            ),
          ),
          width: MediaQuery.of(context).size.width,
        ),
        onClosing: () {
          print("Closed");
          setState(() {
            modelHeight=0;
          });
        },
      ),
      appBar: AppBar(
       leading: Icon(Icons.menu),
        title: Text("Cloud Music Player",style: GoogleFonts.poppins(),),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
        elevation: 2,
      ),
      body: songs==null?Center(child: CircularProgressIndicator(),):RefreshIndicator(
        onRefresh: getSongs,
        child: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context,i) {
            return Container(
              child: ListTile(
                contentPadding: EdgeInsets.all(3),
                title: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(songs[i]["songName"],style: GoogleFonts.poppins(fontWeight: FontWeight.w600),),
                ),
                focusColor: Colors.green,
                hoverColor: Colors.green,
                subtitle: Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: Text(songs[i]["artist"],style: GoogleFonts.poppins(),),
                ),
                enabled: true,
                trailing: Wrap(
                  children: [
                    IconButton(
                      onPressed: () async{
                        //print(songs[i]['file']);
                        var duration=await player.setUrl(songs[i]['file']);
                        setState(() {
                          currentSong=songs[i]["songName"];
                          duration=Duration(seconds: 200);
                          print(duration);
                        });
                        player.play();
                      },
                      icon: Icon(Icons.play_arrow,size: 30,),
                    ),
                    IconButton(
                      onPressed: () async{
                        player.stop();
                      },
                      icon: Icon(Icons.stop,size: 30,color: Colors.red,),
                    ),
                  ],
                ),
                onTap: () async{
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
