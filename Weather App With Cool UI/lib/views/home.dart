import 'package:content_placeholder/content_placeholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/services/fetchWeather.dart';
import 'package:weather_app/views/appbar.dart';
import 'package:weather_app/views/cityAddPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime currTime = DateTime.now();
  WeatherModel model;

  setWeather() async{
    WeatherModel temp = await getWeatherByLatLng();
    setState(() {
      model = temp;
    });
  }

  @override
  void initState() {
    super.initState();
    setWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color.fromRGBO(236, 172, 33, 1),
                  Color.fromRGBO(237, 120, 3, 1)
                ])),
          ),
          Positioned(
            top: 40,
            child: CustomAppBar(
                leading: IconButton(
                  color: Colors.white,
                  splashColor: Colors.amber,
                  icon: Icon(FeatherIcons.thermometer),
                  onPressed: () {
                  },
                ),
                action: IconButton(
                  color: Colors.white,
                  splashColor: Colors.amber,
                  icon: Icon(FeatherIcons.search),
                  onPressed: () {
                    Get.to(AddCity());
                  },
                ),
                title: DateFormat('EEEE , MMM d').format(currTime)),
          ),
          Positioned(
            top: 110,
            child:SizedBox(
              width: Get.width,
              child: model !=null ?Container(
                height: 250,
                padding: EdgeInsets.only(left: 15),
                width: Get.width,
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child:  Stack(
                  children: [
                    Container(
                      height: 250,
                      width: Get.width,
                      child: CustomPaint(
                        size: Size(Get.width,250),
                        painter: RPSCustomPainter(),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(model.name,style: GoogleFonts.montserrat(fontSize: 23,color: Colors.orange),),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(model.temprature+" F",style: GoogleFonts.poppins(fontSize: 50,color: Colors.orange,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Row(
                            children: [
                              Icon(FeatherIcons.triangle,color: Colors.orange,),
                              SizedBox(width: 10,),
                              Text(model.main,style: GoogleFonts.poppins(fontSize: 18,color: Colors.orange,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Icon(FeatherIcons.arrowRight,color: Colors.orange,),
                              SizedBox(width: 10,),
                              Text(model.Description.capitalize,style: GoogleFonts.poppins(fontSize: 18,color: Colors.orange,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ):
              SizedBox(
                width: Get.width,
                child: Container(
                  height: 250,
                  padding: EdgeInsets.only(left: 5,top: 5),
                  width: Get.width,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ContentPlaceholder(
                    height: 250,
                    width: Get.width,
                    highlightColor: Colors.grey[300],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 400,
            child: Container(
              height: 60,
              width: Get.width,
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
              ),
              child: Text("A Deeper Look",style: GoogleFonts.poppins(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w500),),
            ),
          ),
          Positioned(
            top: 470,
            child: SizedBox(
              width: Get.width,
              child: model!=null?Container(
                height: 220,
                width: Get.width,
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    WeatherCard(title: "Wind Speed",subtitle: model.Wind_Speed,unit: "m/Sec",),
                    WeatherCard(title: "Humidity",subtitle: model.Humidity,unit: "%"),
                    WeatherCard(title: "Pressure",subtitle: model.Pressure,unit: "hPa"),

                  ],
                ),
              ):
              Container(
                height: 250,
                width: Get.width,
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 180,
                      width: 220,
                      margin: EdgeInsets.only(right: 14),
                      child: ContentPlaceholder(),
                    ),
                    Container(
                      height: 180,
                      width: 220,
                      margin: EdgeInsets.only(right: 14),
                      child: ContentPlaceholder(),
                    ),
                    Container(
                      height: 180,
                      width: 220,
                      child: ContentPlaceholder(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: Get.width,
              height: 80,
              child: WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [Colors.red, Color(0xEEF44336)],
                    [Colors.red[800], Color(0x77E57373)],
                    [Colors.orange, Color(0x66FF9800)],
                    [Colors.yellow, Color(0x55FFEB3B)]
                  ],
                  durations: [35000, 19440, 10800, 6000],
                  heightPercentages: [0.20, 0.23, 0.25, 0.30],
                  blur: MaskFilter.blur(BlurStyle.solid, 10),
                  gradientBegin: Alignment.bottomLeft,
                  gradientEnd: Alignment.topRight,
                ),
                waveAmplitude: 0,
                size: Size(
                  double.infinity,
                  double.infinity,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = new Paint()
      ..color = Colors.deepOrange
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width*0.50,size.height*0.00);
    path.lineTo(size.width*1.00,size.height*0.00);
    path.lineTo(size.width*1.00,size.height*0.68);
    path.quadraticBezierTo(size.width*0.82,size.height*0.02,size.width*0.77,size.height*0.55);
    path.cubicTo(size.width*0.71,size.height*0.74,size.width*0.63,size.height*0.46,size.width*0.58,size.height*0.33);
    path.quadraticBezierTo(size.width*0.56,size.height*0.26,size.width*0.50,size.height*0.00);
    path.close();


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class RPSCustomPainter2 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = new Paint()
      ..color = Color.fromRGBO(237, 105, 52,1)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0,size.height*1.00);
    path.lineTo(size.width*1.00,size.height*1.00);
    path.lineTo(size.width*1.00,size.height*0.84);
    path.quadraticBezierTo(size.width*0.80,size.height*0.99,size.width*0.50,size.height*0.76);
    path.quadraticBezierTo(size.width*0.37,size.height*0.73,0,size.height*0.83);
    path.lineTo(0,size.height*1.00);
    path.close();


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class RPSCustomPainter3 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = new Paint()
      ..color = Color.fromRGBO(224, 122, 74,1)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width*0.38,0);
    path.lineTo(size.width*1.00,0);
    path.quadraticBezierTo(size.width*1.00,size.height*0.32,size.width*1.00,size.height*0.42);
    path.quadraticBezierTo(size.width*0.89,size.height*0.02,size.width*0.38,0);
    path.close();


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}





Widget WeatherCard({title,subtitle,paint,unit}) {
  return Container(
    height: 180,
    width: 220,
    margin: EdgeInsets.only(right: 14),
    decoration: BoxDecoration(
        color: Colors.white,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Stack(
      children: [
        Container(
          height: 220,
          width: 220,
          child: CustomPaint(
            size: Size(220,220),
            painter: RPSCustomPainter2(),
          ),
        ),
        Container(
          height: 220,
          width: 220,
          child: CustomPaint(
            size: Size(220,220),
            painter: RPSCustomPainter3(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text(title,style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.orange),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(subtitle,style: GoogleFonts.poppins(fontSize: 45,fontWeight: FontWeight.bold,color: Colors.orange),),
                    Text(unit,style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.orange),),
                  ],
                ),
            ],
          ),
        ),
      ],
    ),
  );
}



