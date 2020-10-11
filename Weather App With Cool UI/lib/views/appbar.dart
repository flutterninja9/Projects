import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

Widget CustomAppBar({title,leading,action}) {
  return Container(
    width: Get.width,
    padding: EdgeInsets.only(left: 10,right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leading,
        Text(title,style: GoogleFonts.montserrat(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),),
        action,
      ],
    ),
  );
}