import 'dart:convert';
import 'package:craftly/helpers/urls.dart';
import 'package:craftly/screens/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  var logged_in = 'false'.obs;
  var logging_in = 'false'.obs;
  var defaultGender = 'M'.obs;

  Rx<String> token = Rx<String>();
  Rx<String> userName = Rx<String>();
  Rx<List> genders = Rx<List>();
  Rx<File> profilePic = Rx<File>();

  //Just a helper function for toggling buttons
  switchOnLoader() {
    logging_in.value = 'true';
  }

  switchOffLoader() {
    logging_in.value = 'false';
  }

  // Logic for picking up profile image

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    return pickedFile;
  }

  cropImage() async {
    PickedFile image = await getImage();
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop it!',
            toolbarColor: Get.theme.primaryColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    profilePic.value = croppedFile;
  }

  // Get genders
  getGenders() {
    genders.value = ['Male', 'Female', 'Others'];
  }

  // Changing default gender in the register screen
  changeGender({gender}) {
    defaultGender.value = gender;
  }

  //Login
  login({String username, String password}) async {
    try {
      logging_in.value = 'true';
      http.Response response = await http
          .post(loginURL, body: {'username': username, 'password': password});
      Map<String, dynamic> result = jsonDecode(response.body);
      if (result['error'] == "recheck the credentials") {
        logging_in.value = 'false';
        Get.rawSnackbar(
            title: 'Oops!',
            message: "Some error occured",
            duration: Duration(seconds: 1));
      } else {
        logged_in.value = 'true';
        token.value = result['Token'];
        userName.value = result['user'];
        logging_in.value = 'false';

        ///print(token.value);
        Get.offAll(Root());
      }
    } catch (e) {
      print(e);
      logging_in.value = 'false';
    }
  }

  // Register API

  register(
      {String firstName,
      String lastName,
      String userName,
      String password,
      String email,
      File profilePic,
      String phone}) async {
    logging_in.value = 'true';
    var postUri = Uri.parse(registerURL);
    http.MultipartRequest request = new http.MultipartRequest("POST", postUri);

    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('pic', profilePic.path);

    request.files.add(multipartFile);
    request.fields.addAll({
      'username': userName,
      'password': password,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'gender': defaultGender.value,
    });

    try {
      http.StreamedResponse response = await request.send();
      String reason = response.reasonPhrase;
      logging_in.value = "false";
      if (reason == "OK" && response.statusCode == 200) {
        Get.back();
        Get.rawSnackbar(
            title: 'Success',
            message: 'You can now login',
            duration: Duration(seconds: 1));
      } else {
        Get.rawSnackbar(
            title: 'Failed!',
            message: 'Try changing your email or username',
            duration: Duration(seconds: 1));
      }
    } catch (e) {
      print(e);
      logging_in.value = "false";
      Get.rawSnackbar(
          title: 'Failed!',
          message: 'Some error occured',
          duration: Duration(seconds: 1));
    }
  }

  // Logic for logging out

  logout() {
    token.value = null;
    logged_in.value = "false";
    Get.offAll(Root());
    Get.rawSnackbar(
        title: 'Logged out',
        message: 'You have been logged out successfully!',
        duration: Duration(seconds: 1));
  }

  // For changing email
  Future<int> changeEmail({String email}) async {
    switchOnLoader();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token ' + token.value
    };
    Map<String, String> body = {'email': email};
    http.Response response = await http.post(changeEmailURL,
        headers: headers, body: json.encode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    if (result['success'] == 'email changed successfully!') {
      switchOffLoader();
      Get.back();
      Get.rawSnackbar(
          title: 'Success',
          message: 'Email changed successfully',
          duration: Duration(seconds: 1));
      return 1;
    } else {
      switchOffLoader();
      Get.rawSnackbar(
          title: 'Oops!',
          message: 'Some error occured',
          duration: Duration(seconds: 1));
      return 0;
    }
  }

  @override
  void onInit() {
    getGenders();
    super.onInit();
  }
}
