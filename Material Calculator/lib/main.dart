import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:function_tree/function_tree.dart';
import 'dart:math' as math;


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
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: Color.fromRGBO(18,18,18,1)
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
    return Scaffold(
      backgroundColor:brightness==Brightness.dark? Color.fromRGBO(18,18,18,1):Colors.white,
      appBar: AppBar(
        backgroundColor: brightness==Brightness.dark? Color.fromRGBO(18,18,18,1):Colors.white,
        elevation:0,
        leading: Icon(Icons.menu,color: brightness==Brightness.dark? Colors.white:Color.fromRGBO(18,18,18,1),),
        title: Text("Calculator",style: GoogleFonts.poppins(color: brightness==Brightness.dark? Colors.white:Color.fromRGBO(18,18,18,1),),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                color: brightness==Brightness.dark? Color.fromRGBO(18,18,18,1):Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: _controller,
                      readOnly: true,
                      textAlign: TextAlign.end,
                      showCursor: false,
                      style: GoogleFonts.poppins(color: brightness==Brightness.dark? Colors.white:Color.fromRGBO(18,18,18,1),fontSize: 35),
                      cursorColor: Colors.transparent,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height-186,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CalcButtonHigh(mid: "%"),
                        CalcButtonLow(mid: "sqrt(x)"),
                        CalcButtonLow(mid: "7"),
                        CalcButtonLow(mid: "4"),
                        CalcButtonLow(mid: "1"),
                        CalcButtonLow(mid: "AC"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CalcButtonHigh(mid: "CE"),
                        CalcButtonLow(mid: "x^2"),
                        CalcButtonLow(mid: "8"),
                        CalcButtonLow(mid: "5"),
                        CalcButtonLow(mid: "2"),
                        CalcButtonLow(mid: "0"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CalcButtonHigh(mid: "C"),
                        CalcButtonLow(mid: "x^3"),
                        CalcButtonLow(mid: "9"),
                        CalcButtonLow(mid: "6"),
                        CalcButtonLow(mid: "3"),
                        CalcButtonLow(mid: "."),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CalcButtonHigh(mid: "DEL"),
                        CalcButtonLow(mid: "/"),
                        CalcButtonLow(mid: "*"),
                        CalcButtonLow(mid: "-"),
                        CalcButtonLow(mid: "+"),
                        CalcButtonLow(mid: "="),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CalcButtonLow({mid}) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        if(mid=="=") {
          _controller.text=Calc(_controller.text);
        }
        else if(mid=="x^2") {
          var result=math.pow(int.parse(_controller.text), 2);
          _controller.text=result.toString();
        }
        else if(mid=="x^3") {
          var result=math.pow(int.parse(_controller.text), 3);
          _controller.text=result.toString();
        }
        else if(mid=="sqrt(x)") {
          var result=math.pow(int.parse(_controller.text), 0.5);
          _controller.text=result.toString();
        }
        else if(mid=="AC") {
          _controller.text="";
        }
        else {
          _controller.text+=mid;
        }
      },
      child: Container(
        height: 90,
        width: 90,
        margin: EdgeInsets.only(top: 10),
        color: SchedulerBinding.instance.window.platformBrightness==Brightness.dark? Color.fromRGBO(18,18,18,1):Colors.white,
        child: Center(
          child: Text(mid,style: GoogleFonts.poppins(color: SchedulerBinding.instance.window.platformBrightness==Brightness.dark? Colors.white:Color.fromRGBO(18,18,18,1),fontSize: 25),),
        ),
      ),
    );
  }

  Widget CalcButtonHigh({mid}) {
    return InkWell(
      onTap: () {
        if(mid=="CE") {
          _controller.text="";
        }
        else if(mid=="C") {
          _controller.text="";
        }
        else if(mid=="DEL") {
          _controller.text=_controller.text.substring(0,_controller.text.length-1);
        }
        else if(mid=="%") {
          _controller.text=_controller.text+"%";
        }

      },
      child: Container(
        height: 90,
        width: 90,
        color: SchedulerBinding.instance.window.platformBrightness==Brightness.dark? Color.fromRGBO(18,18,18,1):Colors.white,
        child: Center(
          child: Text(mid,style: GoogleFonts.poppins(color: SchedulerBinding.instance.window.platformBrightness==Brightness.dark? Colors.white:Color.fromRGBO(18,18,18,1),fontSize: 25),),
        ),
      ),
    );
  }

  String Calc(expression) {
    final result=expression.toString().interpret();
    return result.toString();
  }

}
