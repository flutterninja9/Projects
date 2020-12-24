import 'package:cached_network_image/cached_network_image.dart';
import 'package:craftly/controllers/authController.dart';
import 'package:craftly/controllers/cartController.dart';
import 'package:craftly/controllers/productController.dart';
import 'package:craftly/data/models/productModel.dart';
import 'package:craftly/screens/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  Product product;
  CartController cartController = Get.put(CartController());
  ProductController productController = Get.find();
  AuthController controller = Get.find();
  DetailPage({@required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Feather.arrow_left,
                color: Color.fromRGBO(18, 18, 18, 1),
              ),
              onPressed: () {
                Get.back();
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.shopping_bag,
                  color: Color.fromRGBO(18, 18, 18, 1),
                ),
                onPressed: () {
                  Get.to(Cart());
                },
              )
            ],
            expandedHeight: Get.height * 0.7,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: CachedNetworkImage(
                  imageUrl: product.image1,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        height: 7,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(18, 18, 18, 1),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        padding: EdgeInsets.only(left: 8, right: 8),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(2)),
                        child: Text(
                          product.categoryPlain,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          product.productName,
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Text("₹" + product.discountedPrice.toString(),
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Text("₹" + product.sellingPrice.toString(),
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey[800])),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        child: Text(
                          "Your size",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                            height: 50,
                            margin: EdgeInsets.only(
                                left: 10, top: 15, bottom: 15, right: 10),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productController.sizes.length,
                              itemBuilder: (context, index) {
                                return Obx(() => GestureDetector(
                                      onTap: () {
                                        productController.changeSize(
                                            size:
                                                productController.sizes[index]);
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15),
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: productController
                                                        .selectedSize.value ==
                                                    productController
                                                        .sizes[index]
                                                ? Theme.of(context).primaryColor
                                                : Colors.grey[300]),
                                        child: Center(
                                          child: Text(
                                            productController.sizes[index],
                                            style: GoogleFonts.ubuntu(
                                                color: productController
                                                            .selectedSize
                                                            .value ==
                                                        productController
                                                            .sizes[index]
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ),
                                      ),
                                    ));
                              },
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          "Details",
                          style: GoogleFonts.ubuntu(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, top: 8, bottom: 20),
                          child: Text(
                            product.productDescription,
                            style: GoogleFonts.roboto(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            cartController.addToCart(
                                product_id: product.id,
                                size: productController.selectedSize.value);
                          },
                          child: Container(
                            height: 60,
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(() => controller.logging_in.value == "true"
                                    ? SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.amber),
                                        ),
                                      )
                                    : Text(
                                        "Add to cart",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
