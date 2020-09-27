import 'dart:ui';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:post_styler/constants.dart';
import 'package:post_styler/controller/controllers.dart';
import 'package:post_styler/views/postpreview.dart';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _controller = PageController(initialPage: 1);
  RootController _rootController= Get.put(RootController());
  String weight = "normal";
  String color = "white";
  String size = "normal";
  File _imageFile;
  ScreenshotController _screenshotController = ScreenshotController();
  File _image;


  void changePage() {
    if(_controller.page.round() == bgs.length-1) {
      _controller.animateToPage(0, duration: Duration(milliseconds: 100), curve: Curves.fastOutSlowIn);
    }
    else {
      _controller.animateToPage(_controller.page.round()+1, duration: Duration(milliseconds: 100), curve: Curves.fastOutSlowIn);
    }
  }

  getPer() async {
    Map<Permission, PermissionStatus> statuses = await [
    Permission.location,
        Permission.storage,
    ].request();
    print(statuses[Permission.location]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(18, 194, 233,1),
                  Color.fromRGBO(196, 113, 237,1),
                  Color.fromRGBO(246, 79, 89,1),
                ]
              )
            ),
            child: PageView.builder(
              controller: _controller,
              itemCount: bgs.length,
              itemBuilder: (context,i) {
                return Stack(
                  children: [
                    Container(
                      height: Get.height,
                      width: Get.width,
                      decoration: BoxDecoration(
                          /*image: DecorationImage(
                            image: NetworkImage(bgs[i]),
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken),
                            fit: BoxFit.cover,
                          ),*/
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Screenshot(
                          controller: _screenshotController,
                            child: PostPreview(bg:bgs[i] ))),
                  ],
                );
              },
            ),
          ),
         Positioned(
           bottom: 0,
           child: SizedBox(
             height: 100,
             width: Get.width,
             child: Container(
               height: 100,
               width: Get.width,
               margin: EdgeInsets.only(left: 5,right: 5,bottom: 5),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(8),
               ),
               child: Row(
                 children: [
                   Expanded(
                     flex: 5,
                     child: Padding(
                       padding: const EdgeInsets.only(left: 10),
                       child: TextFormField(
                         controller:_rootController.postText,
                         onFieldSubmitted: (text) {
                           changePage();
                         },
                         style: GoogleFonts.montserrat(color: kColor),
                         decoration: InputDecoration(
                           labelStyle: GoogleFonts.montserrat(),
                           labelText: "Make A Post",
                           border: OutlineInputBorder(
                             borderSide: BorderSide(
                               color: kColor,
                             )
                           )
                         ),
                       ),
                     ),
                   ),
                   Expanded(
                     flex: 2,
                     child: FlatButton(
                       onPressed: () {
                          changePage();
                       },
                       child: Text('Style It',style: GoogleFonts.montserrat(color: kColor,fontSize: 16,fontWeight: FontWeight.w600),),
                     ),
                   ),
                 ],
               ),
             ),
           ),
         ),
          Positioned(
            top: 30,
            left: 10,
            child: SizedBox(
              height: 50,
              width: Get.width,
              child: Container(
                height: 50,
                width: Get.width,
                margin: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                      IconButton(
                        onPressed: () async {
                          if (await Permission.storage.request().isGranted) {
                            _imageFile = null;
                            _screenshotController
                                .capture()
                                .then((File image) async {
                              //print("Capture Done");
                              setState(() {
                                _imageFile = image;
                              });
                              final result = await ImageGallerySaver.saveImage(image.readAsBytesSync());
                              print("File Saved to Gallery");
                              SocialShare.shareOptions("Custom Image Done!",imagePath: image.path);
                            }).catchError((onError) {
                              print(onError);
                            });
                          }
                        },
                        icon: Icon(Icons.forward,color: Colors.white,size: 40,),
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


