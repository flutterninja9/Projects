import 'package:craftly/controllers/authController.dart';
import 'package:craftly/screens/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                    child: TextFormField(
                      controller: _username,
                      decoration: InputDecoration(
                          hintText: 'Username',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                  Obx(
                    () => Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              color: Colors.amberAccent,
                              onPressed: () async {
                                if (_username.text.length < 1 ||
                                    _password.text.length < 1) {
                                  Get.rawSnackbar(
                                      title: 'Oops!',
                                      message: 'Fields cannot be empty',
                                      duration: Duration(seconds: 1));
                                } else {
                                  await authController.login(
                                      username: _username.text,
                                      password: _password.text);
                                }
                              },
                              child: authController.logging_in == 'true'
                                  ? SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: CircularProgressIndicator())
                                  : Text("SIGN IN"),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 10),
                child: Text(
                  "CraftLy.",
                  style: GoogleFonts.montserrat(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
