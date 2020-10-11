import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchController extends GetxController {
  TextEditingController controller = TextEditingController();


  saveHistory({histList}) async {
    SharedPreferences instance =await  SharedPreferences.getInstance();
    List<dynamic> list= instance.get('history');
    if(list!=null) {
      list.add(histList);
      instance.setStringList('history', list);
      print(list);
    }
    else {
      List<String> test = [];
      test.add(histList);
      instance.setStringList('history', test);
    }
  }


  getHistory() async{
    SharedPreferences instance = await SharedPreferences.getInstance();
    List<dynamic> history = instance.getStringList('history');
    return history.reversed.toList();
  }

  @override
  void onInit() {
    super.onInit();
    controller = TextEditingController();
  }

  @override
  void disposeId(String id) {
    super.disposeId(id);
    controller.dispose();
  }

}