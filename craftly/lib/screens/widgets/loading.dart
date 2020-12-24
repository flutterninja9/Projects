import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            LinearProgressIndicator(),
            Align(
                alignment: Alignment.center,
                child: SpinKitHourGlass(color: Theme.of(context).primaryColor))
          ],
        ),
      ),
    );
  }
}
