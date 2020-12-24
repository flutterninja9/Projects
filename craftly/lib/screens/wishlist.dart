import 'package:cached_network_image/cached_network_image.dart';
import 'package:craftly/controllers/authController.dart';
import 'package:craftly/controllers/externalServiceHandler.dart';
import 'package:craftly/data/models/productModel.dart';
import 'package:craftly/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Wishlist extends StatelessWidget {
  ExternalServiceController serviceController = Get.find();
  AuthController authController = Get.find();
  List<Product> products;
  Wishlist({@required this.products});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: Get.height,
          width: Get.width,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text("Your wishlist",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                elevation: 1,
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.6),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: Get.width * 0.006, right: Get.width * 0.006),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(DetailPage(product: products[index]),
                                transition: Transition.cupertino);
                          },
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: CachedNetworkImage(
                                    imageUrl: products[index].image1,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              decoration: BoxDecoration(
                                                  color: Colors.pinkAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                products[index].categoryPlain,
                                                style: GoogleFonts.roboto(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.01,
                                        ),
                                        Flexible(
                                          child: Text(
                                            products[index].productName,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.roboto(
                                                fontSize: 15),
                                          ),
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.01,
                                        ),
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Text(
                                                  "₹" +
                                                      products[index]
                                                          .discountedPrice
                                                          .toString(),
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                width: Get.width * 0.03,
                                              ),
                                              Text(
                                                  "₹" +
                                                      products[index]
                                                          .sellingPrice
                                                          .toString(),
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      decoration: TextDecoration
                                                          .lineThrough)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () async {
                              await serviceController.removeFromoWishList(
                                  ProdID: products[index].id, context: context);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                margin: EdgeInsets.only(
                                    right: Get.height * 0.007,
                                    top: Get.height * 0.007),
                                padding: EdgeInsets.all(Get.width * 0.01),
                                child: Icon(
                                  Icons.remove,
                                  size: 22,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                  );
                }, childCount: products.length),
              ),
            ],
          ),
        ),
        Obx(
          () => Align(
            alignment: Alignment.topCenter,
            child: authController.logging_in.value == "true"
                ? LinearProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                  )
                : Container(),
          ),
        ),
        products.length == 0
            ? Align(
                alignment: Alignment.center,
                child: Container(
                  child: Image.network(
                      'https://cdn.dribbble.com/users/246611/screenshots/10742148/media/d64b1bc4087cbf2c574a1688ecabc8ee.png?compress=1&resize=800x600'),
                ))
            : Container()
      ],
    ));
  }
}
