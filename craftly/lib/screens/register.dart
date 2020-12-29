import 'package:craftly/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  TextEditingController _username = TextEditingController();

  TextEditingController _password = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();

  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: TextFormField(
                        controller: _firstname,
                        decoration: InputDecoration(
                            hintText: 'First Name',
                            prefixIcon: Icon(Feather.user),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: TextFormField(
                        controller: _lastname,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Feather.user),
                            hintText: 'Last Name',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: TextFormField(
                        controller: _username,
                        decoration: InputDecoration(
                            hintText: 'Username',
                            prefixIcon: Icon(Feather.user_check),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Feather.mail),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: TextFormField(
                        controller: _phone,
                        decoration: InputDecoration(
                            hintText: 'Phone',
                            prefixIcon: Icon(Feather.phone),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: TextFormField(
                        controller: _password,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Feather.key),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    Container(
                        margin:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Obx(() => DropdownButton(
                                  dropdownColor: Colors.grey[200],
                                  onChanged: (val) {
                                    authController.changeGender(gender: val);
                                  },
                                  value: authController.defaultGender.value,
                                  items: authController.genders.value
                                      .map((gender) => DropdownMenuItem(
                                            child: Text(gender),
                                            value: gender
                                                .toString()
                                                .substring(0, 1),
                                          ))
                                      .toList(),
                                )),
                            MaterialButton(
                              color: Colors.amberAccent,
                              onPressed: () async {
                                await authController.cropImage();
                              },
                              child: Text("Select a Picture"),
                            ),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                        width: Get.width,
                        child: MaterialButton(
                          color: Colors.amberAccent,
                          onPressed: () async {
                            if (_username.text.length < 1 ||
                                _password.text.length < 1 ||
                                _firstname.text.length < 1 ||
                                _lastname.text.length < 1 ||
                                _email.text.length < 1 ||
                                _phone.text.length < 1 ||
                                authController.profilePic.value.isNull) {
                              Get.rawSnackbar(
                                  title: 'Oops!',
                                  message: 'Fields cannot be empty',
                                  duration: Duration(seconds: 1));
                            } else {
                              await authController.register(
                                  firstName: _firstname.text,
                                  lastName: _lastname.text,
                                  userName: _username.text,
                                  email: _email.text,
                                  password: _password.text,
                                  profilePic: authController.profilePic.value,
                                  phone: _phone.text);
                            }
                          },
                          child: Obx(() =>
                              authController.logging_in.value == 'true'
                                  ? SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: CircularProgressIndicator())
                                  : Text("Register")),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
