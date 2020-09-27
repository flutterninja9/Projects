import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_styler/controller/controllers.dart';

Widget PostPreview({bg}) {
  RootController _root = Get.find();
  return Container(
    height: 400,
    width: Get.width,
    padding: EdgeInsets.only(left: 10,right: 10),
    margin: EdgeInsets.only(left: 10,right: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      image: DecorationImage(
        image: NetworkImage(bg),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Center(
      child:GetBuilder(
        builder: (context) =>  Text(_root.postText.text,style: GoogleFonts.montserrat(color: ContentController().primaryColor,fontSize: ContentController().fontSize,fontWeight: ContentController().defaultWeight),),
      ),
    ),
  );
}