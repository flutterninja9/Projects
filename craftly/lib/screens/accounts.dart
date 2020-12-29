import 'package:craftly/bloc/bloc/product_bloc.dart';
import 'package:craftly/controllers/authController.dart';
import 'package:craftly/data/models/userModel.dart';
import 'package:craftly/helpers/urls.dart';
import 'package:craftly/screens/address_intro.dart';
import 'package:craftly/screens/placedOrders.dart';
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
              margin: EdgeInsets.only(left: 5, right: 5),
              child: Column(
                children: [
                  Obx(() => controller.logging_in.value == "true"
                      ? LinearProgressIndicator()
                      : Container()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              baseMediaURL + user.accountDetails[0].profilePic),
                          backgroundColor: Colors.grey[200],
                          radius: 50,
                        )
                      ],
                    ),
                  ),
                  Divider(),
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
                  Card(
                    elevation: 3,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            user.username,
                            style: GoogleFonts.roboto(),
                          ),
                          leading: Icon(Feather.user),
                        ),
                        ListTile(
                          title: Text(
                            user.email,
                            style: GoogleFonts.roboto(),
                          ),
                          leading: Icon(Feather.mail),
                          trailing: Text(
                            "EDIT",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500),
                          ),
                          onTap: () {
                            Get.defaultDialog(
                                title: 'Change your email',
                                content: Stack(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.mail)),
                                        onFieldSubmitted: (email) async {
                                          if (email.length == 0) {
                                            Get.rawSnackbar(
                                                title: 'Nooo!',
                                                message:
                                                    'This field cannot be empty',
                                                duration: Duration(seconds: 1));
                                          } else {
                                            int statusCode = await controller
                                                .changeEmail(email: email);
                                            if (statusCode == 0) {
                                            } else {
                                              BlocProvider.of<ProductBloc>(
                                                      context)
                                                  .add(GetAccount());
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        ),
                        ListTile(
                          title: Text(
                            user.accountDetails[0].phoneNo,
                            style: GoogleFonts.roboto(),
                          ),
                          leading: Icon(Feather.phone),
                        ),
                        ListTile(
                          title: Text(
                            "My Orders",
                            style: GoogleFonts.roboto(),
                          ),
                          leading: Icon(Feather.user),
                          onTap: () {
                            BlocProvider.of<ProductBloc>(context)
                                .add(GetOrders());
                            Get.to(BlocProvider.value(
                              value: BlocProvider.of<ProductBloc>(context),
                              child: MyOrders(),
                            ));
                          },
                        ),
                        ListTile(
                          title: Text(
                            "Addresses",
                            style: GoogleFonts.roboto(),
                          ),
                          leading: Icon(Feather.user),
                          onTap: () {
                            Get.to(AddressIntro());
                          },
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
