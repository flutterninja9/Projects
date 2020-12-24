import 'package:get/get.dart';

class ProductController extends GetxController {
// Fetch categories here

  var categories = ['Kurtis', 'Nighwear', 'Modern', 'Sarees', 'For Kids'].obs;

  var sizes = ['M', 'L', 'XL', 'XXL'].obs;

  var selectedSize = "M".obs;

  // Default selected category

  var selectedCategory = "Kurtis".obs;

  //Change default selected Ctaegory

  changeCategory({String newCat}) {
    selectedCategory.value = newCat;
  }

  changeSize({String size}) {
    selectedSize.value = size;
  }
}
