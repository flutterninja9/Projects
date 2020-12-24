import 'package:craftly/bloc/bloc/product_bloc.dart';
import 'package:craftly/controllers/authController.dart';
import 'package:craftly/controllers/externalServiceHandler.dart';
import 'package:craftly/screens/address.dart';
import 'package:craftly/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressIntro extends StatefulWidget {
  @override
  _AddressIntroState createState() => _AddressIntroState();
}

class _AddressIntroState extends State<AddressIntro> {
  ExternalServiceController serviceController = Get.find();
  AuthController controller = Get.find();
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(GetAddress());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              BlocProvider.of<ProductBloc>(context).add(GetAccount());
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            "Saved Addresses",
            style: GoogleFonts.montserrat(),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(BlocProvider.value(
              value: BlocProvider.of<ProductBloc>(context),
              child: Address(
                update: false,
                nameTemp: "",
                contactTemp: "",
                pincodeTemp: "",
                addressTemp: "",
                cityTemp: "",
                localityTemp: "",
                stateTemp: "",
              ),
            ));
          },
          icon: Icon(Icons.add),
          label: Text("Address"),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is Loading) {
              return LoadingWidget();
            } else if (state is AddressLoaded) {
              return Container(
                  height: Get.height,
                  width: Get.width,
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height,
                        width: Get.width,
                        child: ListView.builder(
                          itemCount: state.addresses.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            state.addresses[index]
                                                .toWhomDelivery,
                                            style: GoogleFonts.roboto(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500)),
                                        Row(
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  Get.to(BlocProvider.value(
                                                    value: BlocProvider.of<
                                                        ProductBloc>(context),
                                                    child: Address(
                                                      update: true,
                                                      nameTemp: state
                                                          .addresses[index]
                                                          .toWhomDelivery,
                                                      contactTemp: state
                                                          .addresses[index]
                                                          .contactNo,
                                                      pincodeTemp: state
                                                          .addresses[index]
                                                          .pincode,
                                                      addressTemp: state
                                                          .addresses[index]
                                                          .address,
                                                      cityTemp: state
                                                          .addresses[index]
                                                          .city,
                                                      localityTemp: state
                                                          .addresses[index]
                                                          .locality,
                                                      stateTemp: state
                                                          .addresses[index]
                                                          .state,
                                                      id: state
                                                          .addresses[index].id,
                                                    ),
                                                  ));
                                                },
                                                child: Icon(Icons.edit)),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                                onTap: () async {
                                                  await serviceController
                                                      .deleteAddress(
                                                          context: context,
                                                          pk: state
                                                              .addresses[index]
                                                              .id);
                                                },
                                                child: Icon(Icons.delete)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            "Contact : " +
                                                state
                                                    .addresses[index].contactNo,
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                              "Address : " +
                                                  state
                                                      .addresses[index].address,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                              "Locality : " +
                                                  state.addresses[index]
                                                      .locality,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                              "City : " +
                                                  state.addresses[index].city,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                              "State : " +
                                                  state.addresses[index].state,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Obx(() => controller.logging_in.value == "true"
                            ? LinearProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.black),
                              )
                            : Container()),
                      ),
                    ],
                  ));
            } else {
              return LoadingWidget();
            }
          },
        ));
  }
}
