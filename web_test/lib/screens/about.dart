import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> with TickerProviderStateMixin{
  final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();
  final GlobalKey<AnimatedCircularChartState> _chartKeyB = new GlobalKey<AnimatedCircularChartState>();
  final GlobalKey<AnimatedCircularChartState> _chartKeyC = new GlobalKey<AnimatedCircularChartState>();
  final GlobalKey<AnimatedCircularChartState> _chartKeyD = new GlobalKey<AnimatedCircularChartState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Overview",style: GoogleFonts.poppins(color: Colors.white),),

      ),
      body: Column( 
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height-50,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
                  color: Color.fromRGBO(245, 243, 242,1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("About",style: GoogleFonts.poppins(color: Colors.green,fontSize: 35,fontWeight: FontWeight.bold),),
                      SizedBox(height: 15,),
                      Wrap(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10,right: 10),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            width: 400,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Name : ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
                                    Text("Anirudh Singh",style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("E-Mail : ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
                                    Text("anirudhisgreat1200@gmail.com",style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Contact:",style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
                                    Text("+91- XXXXXXXXXX",style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Text("Skills",style: GoogleFonts.poppins(color: Colors.green,fontSize: 35,fontWeight: FontWeight.bold),),
                      SizedBox(height: 15,),
                      Wrap(
                        children: [
                            skillGraph(have: 80.0,remaining: 20.0,name: "Python",key: _chartKey),
                            skillGraph(have: 60.0,remaining: 40.0,name: "Flutter",key: _chartKeyB),
                            skillGraph(have: 70.0,remaining: 30.0,name: "Django",key: _chartKeyC),
                            skillGraph(have: 80.0,remaining: 20.0,name: "DRF",key: _chartKeyD),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget skillGraph({name,have,remaining,key}) {
    return Container(
      height: 150,
      width: 150,
      margin: EdgeInsets.only(right: 20,bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            offset: Offset(-3,5),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedCircularChart(
            key: key,
            size: Size(100,100),
            initialChartData: <CircularStackEntry>[
              new CircularStackEntry(
                <CircularSegmentEntry>[
                  new CircularSegmentEntry(
                    have,
                    Colors.green,
                    rankKey: 'completed',
                  ),
                  new CircularSegmentEntry(
                    remaining,
                    Colors.blueGrey[600],
                    rankKey: 'remaining',
                  ),
                ],
                rankKey: 'progress',
              ),
            ],
            chartType: CircularChartType.Radial,
            percentageValues: true,
            holeLabel: have.toString().substring(0,1)+"/10",
            duration: Duration(seconds: 1),
            labelStyle: GoogleFonts.poppins(
              color: Colors.green
            )
          ),
          Text(name,style: GoogleFonts.poppins(color: Color.fromRGBO(18,18,18,1)),),
        ],
      )
    );
  }
}
