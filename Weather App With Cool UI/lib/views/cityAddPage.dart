import 'dart:async';

import 'package:content_placeholder/content_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/controllers/searchcontroller.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/services/fetchWeather.dart';
import 'package:weather_app/views/searchViewAux.dart';

import 'appbar.dart';

class AddCity extends StatefulWidget {
  @override
  _AddCityState createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
  SearchController controllerHandler = SearchController();
  WeatherModel model = WeatherModel();
  List<dynamic> list = [];

  setHist() async{
    List<dynamic> temp = await controllerHandler.getHistory();
    if(mounted) {
      setState(() {
        list = temp;
      });
    }
  }


  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setHist();
    });
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
                      Color.fromRGBO(159,172,190,1),
                      Color.fromRGBO(91,97,126,1)
                    ]
                )
            ),
          ),
          Positioned(
            top: 40,
            child: CustomAppBar(
                leading: IconButton(
                  color: Colors.white,
                  splashColor: Colors.amber,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Get.back();
                  },
                ),
                action: IconButton(
                  color: Colors.white,
                  splashColor: Colors.amber,
                  icon: Icon(FeatherIcons.cloud,size: 30,),
                  onPressed: () {},
                ),
                title: "Search"),
          ),
          Positioned(
            top: 110,
            child: SizedBox(
              width: Get.width,
              child: Container(
                width: Get.width,
                margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextFormField(
                    controller: controllerHandler.controller,
                    style: GoogleFonts.poppins(fontSize: 16),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.poppins(fontSize: 16,color: Colors.grey),
                        hintText: "Search For a Place",
                        prefixIcon: Icon(FeatherIcons.search),
                      ),
                    onFieldSubmitted: (searchText) async {
                          model = await getWeather(place: controllerHandler.controller.text);
                          if(model.main != null) {
                            print(model.name);
                            await controllerHandler.saveHistory(histList: controllerHandler.controller.text);
                            Get.to(SearchAux(model=model));
                          }
                    },
                  ),
                )
              ),
            ),
          ),
          Positioned(
            top: 190,
            child: SizedBox(
              width: Get.width,
              child: Container(
                width: Get.width,
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recent Searches",style: GoogleFonts.poppins(fontSize: 23,color: Colors.white,fontWeight: FontWeight.w600),),
                   list.isNotEmpty? Container(
                      height: MediaQuery.of(context).size.height-250,
                      width: Get.width,
                      child: GridView.builder(
                        itemCount: list.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 15
                        ),
                        itemBuilder: (context,i) {
                          return weatherCard(place: list[i]);
                        },
                      ),
                    ):Container(
                     height: 460,
                     width: Get.width,
                     child: GridView.count(
                       crossAxisCount: 2,
                       crossAxisSpacing: 18,
                       mainAxisSpacing: 0,
                       children: [
                         Container(
                           height: 100,
                           width: 100,
                           child: ContentPlaceholder(),
                         ),
                         Container(
                           height: 100,
                           width: 100,
                           child: ContentPlaceholder(),
                         ),
                         Container(
                           height: 100,
                           width: 100,
                           child: ContentPlaceholder(),
                         ),
                         Container(
                           height: 100,
                           width: 100,
                           child: ContentPlaceholder(
                           ),
                         ),
                       ],
                     ),
                   ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget weatherCard({temp,place}) {
  return InkWell(
    onTap: () async{
     WeatherModel model = await getWeather(place: place);
      if(model.main != null) {
        Get.to(SearchAux(model=model));
      }
    },
    child: Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Color.fromRGBO(162,172,190,1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(place,style: GoogleFonts.poppins(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),
    ),
  );
}


