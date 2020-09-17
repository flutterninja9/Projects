import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light
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
  TextEditingController _controller=TextEditingController();
  Map data=null;
  bool isLoading=false;
  String status;

  Future<void> getData({city}) async{
    try {
      Response response = await get("http://anirudh1998.pythonanywhere.com/covidtest/search/$city/");
      setState(() {
        isLoading=true;
      });
      setState(() {
        data=jsonDecode(response.body);
        isLoading=false;
      });
    }
    catch(e) {
      setState(() {
        status="Sorry!   Country Not Found";
      });
    }

  }


  @override
  void initState() {
    super.initState();
    _controller=TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("COVID-19 PROTOTYPE",style:GoogleFonts.poppins()),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
            ),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                margin: EdgeInsets.only(left: 10,right: 10),
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Search For A Country",
                      hintStyle: GoogleFonts.poppins(color: Colors.green),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search,color: Colors.green,)
                    ),
                  onSubmitted: (text) async{
                    await getData(city: text);
                  },
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-280,
            child: data==null?Center(child: Text("Search For A Country",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)):
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: isLoading==false?SizedBox(
                    height: 250,
                    child: Card(
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("ID: ",style: GoogleFonts.ubuntu(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text(data['id'].toString(),style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("COUNTRY NAME: ",style: GoogleFonts.ubuntu(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text(data['country'].toString(),style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("COUNTRY CODE:",style: GoogleFonts.ubuntu(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text(data['country_code'].toString(),style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("TOTAL CASES: ",style: GoogleFonts.ubuntu(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text(data['total_cases'].toString(),style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("RECOVERED CASES: ",style: GoogleFonts.ubuntu(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text(data['recovered_cases'].toString(),style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("DEATH CASES: ",style: GoogleFonts.ubuntu(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text(data['death_cases'].toString(),style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ):Center(
                    child: status==null?CircularProgressIndicator():Text(status,style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
