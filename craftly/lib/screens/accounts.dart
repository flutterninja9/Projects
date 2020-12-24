import 'package:craftly/bloc/bloc/product_bloc.dart';
import 'package:craftly/controllers/authController.dart';
import 'package:craftly/data/models/addressModel.dart';
import 'package:craftly/data/models/userModel.dart';
import 'package:craftly/helpers/urls.dart';
import 'package:craftly/screens/address.dart';
import 'package:craftly/screens/address_intro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatelessWidget {
  User user;
  AuthController controller = Get.find();
  Account({@required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(
              Feather.triangle,
              color: Color.fromRGBO(18, 18, 18, 1),
            ),
            title: Text(
              'Account',
              style: GoogleFonts.poppins(color: Color.fromRGBO(18, 18, 18, 1)),
            ),
            backgroundColor: Theme.of(context).canvasColor,
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(baseMediaURL + user.profilePic),
                          backgroundColor: Colors.grey[200],
                          radius: 50,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.userName.value,
                        style: GoogleFonts.manrope(fontSize: 18),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Container(
                    height: Get.height * 0.1,
                    margin: EdgeInsets.only(left: 10, bottom: 15),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Center(
                                child: Text(
                              "Orders",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(18, 18, 18, 1)),
                            )),
                          ),
                        ),
                        Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Center(
                                child: Text(
                              "Settings",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(18, 18, 18, 1)),
                            )),
                          ),
                        ),
                        Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Center(
                                child: Text(
                              "Payments",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(18, 18, 18, 1)),
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(AddressIntro());
                          },
                          child: Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Center(
                                  child: Text(
                                "Address",
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(18, 18, 18, 1)),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "userName",
                            style: GoogleFonts.roboto(),
                          ),
                          leading: Icon(Feather.user),
                          trailing: Text(
                            "EDIT",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "test@gmail.com",
                            style: GoogleFonts.roboto(),
                          ),
                          leading: Icon(Feather.mail),
                          trailing: Text(
                            "EDIT",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            user.phoneNo,
                            style: GoogleFonts.roboto(),
                          ),
                          leading: Icon(Feather.phone),
                          trailing: Text(
                            "EDIT",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        ListTile(
                          tileColor: Colors.white,
                          onTap: () {
                            controller.logout();
                          },
                          title: Text(
                            "Help",
                            style: GoogleFonts.roboto(color: Colors.black),
                          ),
                          leading: Icon(
                            Icons.question_answer,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          tileColor: Colors.white,
                          onTap: () {
                            controller.logout();
                          },
                          title: Text(
                            "Logout",
                            style: GoogleFonts.roboto(color: Colors.red),
                          ),
                          leading: Icon(
                            Feather.log_out,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
