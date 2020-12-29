import 'package:cached_network_image/cached_network_image.dart';
import 'package:craftly/bloc/bloc/product_bloc.dart';
import 'package:craftly/controllers/authController.dart';
import 'package:craftly/controllers/externalServiceHandler.dart';
import 'package:craftly/controllers/productController.dart';
import 'package:craftly/controllers/uiController.dart';
import 'package:craftly/screens/accounts.dart';
import 'package:craftly/screens/cart.dart';
import 'package:craftly/screens/product_detail.dart';
import 'package:craftly/screens/search.dart';
import 'package:craftly/screens/widgets/loading.dart';
import 'package:craftly/screens/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' as getX;
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductController productController = getX.Get.put(ProductController());
  AuthController authController = getX.Get.find();
  PageController pageController = PageController();
  UIController uiController = getX.Get.find();
  ExternalServiceController serviceController =
      getX.Get.put(ExternalServiceController());
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(GetProducts());
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getX.Obx(() => BottomNavigationBar(
            currentIndex: uiController.selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: (index) {
              uiController.manageHomePage(index: index, context: context);
            },
            items: [
              BottomNavigationBarItem(label: 'Home', icon: Icon(Feather.home)),
              BottomNavigationBarItem(
                  label: 'Search', icon: Icon(Feather.search)),
              BottomNavigationBarItem(
                  label: 'Wishlist', icon: Icon(Feather.heart)),
              BottomNavigationBarItem(
                  label: 'Account', icon: Icon(Feather.user)),
            ],
          )),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is Loading) {
            return LoadingWidget();
          } else if (state is Loaded) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 10,
                  title: Text("CraftLy.",
                      style: GoogleFonts.manrope(fontWeight: FontWeight.w700)),
                  floating: true,
                  actions: [
                    IconButton(
                      onPressed: () {
                        getX.Get.to(Cart(),
                            transition: getX.Transition.cupertino);
                      },
                      icon: Icon(Icons.shopping_bag_outlined),
                    ),
                  ],
                ),

                SliverToBoxAdapter(
                  child: Container(
                      height: 250,
                      width: getX.Get.width,
                      margin: EdgeInsets.only(bottom: 8, top: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: state.promos.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 250,
                            width: getX.Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.pink.withOpacity(0.6),
                            ),
                            margin: EdgeInsets.only(right: 6, left: 6, top: 5),
                            child: CachedNetworkImage(
                              imageUrl: state.promos[index].image,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          );
                        },
                      )),
                ),
                SliverToBoxAdapter(
                  child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                      height: 50,
                      width: getX.Get.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.categories.length,
                        itemBuilder: (context, index) {
                          return getX.Obx(() => GestureDetector(
                                onTap: () {
                                  productController.changeCategory(
                                      newCat:
                                          productController.categories[index]);
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.easeIn,
                                  height: 50,
                                  width: 120,
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: productController
                                                  .selectedCategory.value ==
                                              productController
                                                  .categories[index]
                                          ? Colors.pinkAccent
                                          : Colors.grey[200]),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            productController.categories[index],
                                            style: GoogleFonts.montserrat(
                                                fontSize: 16,
                                                color: productController
                                                            .selectedCategory
                                                            .value ==
                                                        productController
                                                            .categories[index]
                                                    ? Colors.white
                                                    : Theme.of(context)
                                                        .accentColor,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                        },
                      )),
                ),
                // SliverToBoxAdapter(
                //   child: Container(
                //     padding: EdgeInsets.only(
                //         left: getX.Get.width * 0.015,
                //         top: getX.Get.width * 0.03,
                //         bottom: getX.Get.width * 0.03),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         RichText(
                //           text: TextSpan(
                //               text: "Hello ",
                //               style: GoogleFonts.poppins(
                //                   fontSize: 22, color: Colors.grey[700]),
                //               children: [
                //                 TextSpan(
                //                     text: authController.userName.value,
                //                     style: GoogleFonts.poppins(
                //                         fontSize: 22,
                //                         fontWeight: FontWeight.bold,
                //                         color: Theme.of(context).primaryColor)),
                //                 TextSpan(
                //                     text: " !",
                //                     style: GoogleFonts.poppins(
                //                         fontSize: 22, color: Colors.grey[700])),
                //               ]),
                //         ),
                //         Text("What do you want to buy today?",
                //             style: GoogleFonts.poppins(
                //                 fontSize: 20, color: Colors.grey[700])),
                //       ],
                //     ),
                //   ),
                // ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.6),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: getX.Get.width * 0.006,
                          right: getX.Get.width * 0.006),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              getX.Get.to(
                                  DetailPage(product: state.products[index]),
                                  transition: getX.Transition.cupertino);
                            },
                            child: Card(
                              elevation: 4,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: CachedNetworkImage(
                                      imageUrl: state.products[index].image1,
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
                                                        BorderRadius.circular(
                                                            3)),
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  state.products[index]
                                                      .categoryPlain,
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: getX.Get.height * 0.01,
                                          ),
                                          Flexible(
                                            child: Text(
                                              state.products[index].productName,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 15),
                                            ),
                                          ),
                                          SizedBox(
                                            height: getX.Get.height * 0.01,
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Text(
                                                    "₹" +
                                                        state.products[index]
                                                            .discountedPrice
                                                            .toString(),
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                SizedBox(
                                                  width: getX.Get.width * 0.03,
                                                ),
                                                Text(
                                                    "₹" +
                                                        state.products[index]
                                                            .sellingPrice
                                                            .toString(),
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
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
                                await serviceController.addToWishList(
                                    ProdID: state.products[index].id);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                margin: EdgeInsets.only(
                                    right: getX.Get.height * 0.007,
                                    top: getX.Get.height * 0.007),
                                padding: EdgeInsets.all(getX.Get.width * 0.01),
                                child: Icon(
                                  Icons.favorite,
                                  size: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }, childCount: state.products.length),
                ),
              ],
            );
          } else if (state is AccountDetail) {
            return Account(user: state.userAccount);
          } else if (state is WishListPage) {
            return Wishlist(
              products: state.products,
            );
          } else if (state is SearchLoaded) {
            return Search(
              products: state.products,
            );
          } else if (state is LoadingFailed) {
            return Container(
              child: Center(
                child: Icon(
                  Icons.sms_failed,
                  size: 35,
                  color: Colors.red,
                ),
              ),
            );
          } else {
            return LoadingWidget();
          }
        },
      ),
    );
  }
}
