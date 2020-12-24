import 'package:cached_network_image/cached_network_image.dart';
import 'package:craftly/data/models/productModel.dart';
import 'package:craftly/helpers/urls.dart';
import 'package:craftly/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  List<Product> products;
  Search({@required this.products});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Search results',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(18, 18, 18, 1)),
            ),
            leading: Icon(
              Feather.search,
              color: Color.fromRGBO(18, 18, 18, 1),
            ),
            backgroundColor: Colors.white,
            elevation: 3,
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
                                imageUrl: baseMediaURL + products[index].image1,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          padding: const EdgeInsets.all(8.0),
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
                                        style: GoogleFonts.roboto(fontSize: 15),
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
                                                  fontWeight: FontWeight.bold)),
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
                                                  fontWeight: FontWeight.bold)),
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
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        margin: EdgeInsets.only(
                            right: Get.height * 0.007, top: Get.height * 0.007),
                        padding: EdgeInsets.all(Get.width * 0.01),
                        child: Icon(
                          Icons.favorite,
                          size: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }, childCount: products.length),
          )
        ],
      ),
    );
  }
}
