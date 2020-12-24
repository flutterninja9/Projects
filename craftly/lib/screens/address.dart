import 'package:craftly/bloc/bloc/product_bloc.dart';
import 'package:craftly/controllers/authController.dart';
import 'package:craftly/controllers/externalServiceHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Address extends StatefulWidget {
  String nameTemp;
  String contactTemp;
  String pincodeTemp;
  String localityTemp;
  String addressTemp;
  String cityTemp;
  String stateTemp;
  bool update;
  int id;
  Address(
      {this.addressTemp,
      this.id,
      @required this.update,
      this.nameTemp,
      this.pincodeTemp,
      this.contactTemp,
      this.localityTemp,
      this.cityTemp,
      this.stateTemp});

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  TextEditingController name = TextEditingController();

  TextEditingController contact = TextEditingController();

  TextEditingController pincode = TextEditingController();

  TextEditingController locality = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController city = TextEditingController();

  TextEditingController state = TextEditingController();

  FocusNode nameFocus = FocusNode();

  FocusNode contactFocus = FocusNode();

  FocusNode pincodeFocus = FocusNode();

  FocusNode localityFocus = FocusNode();

  FocusNode addressFocus = FocusNode();

  FocusNode cityFocus = FocusNode();

  FocusNode stateFocus = FocusNode();

  ExternalServiceController controller = Get.find();

  AuthController authController = Get.find();

  @override
  void initState() {
    name = TextEditingController(
        text: widget.nameTemp.isEmpty ? "" : widget.nameTemp);
    contact = TextEditingController(
        text: widget.contactTemp.isEmpty ? "" : widget.contactTemp);
    pincode = TextEditingController(
        text: widget.pincodeTemp.isEmpty ? "" : widget.pincodeTemp);
    locality = TextEditingController(
        text: widget.localityTemp.isEmpty ? "" : widget.localityTemp);
    city = TextEditingController(
        text: widget.cityTemp.isEmpty ? "" : widget.cityTemp);
    address = TextEditingController(
        text: widget.addressTemp.isEmpty ? "" : widget.addressTemp);
    state = TextEditingController(
        text: widget.stateTemp.isEmpty ? "" : widget.stateTemp);
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    pincode.dispose();
    contact.dispose();
    city.dispose();
    state.dispose();
    locality.dispose();
    address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add address",
          style: GoogleFonts.montserrat(),
        ),
        leading: IconButton(
          onPressed: () {
            //BlocProvider.of<ProductBloc>(context).add(GetAddress());
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.addAddress(
              name: name.text,
              contact: contact.text,
              pincode: pincode.text,
              locality: locality.text,
              address: address.text,
              city: city.text,
              id: widget.id.isNull ? 0 : widget.id,
              isUpdate: widget.update,
              state: state.text);
          BlocProvider.of<ProductBloc>(context).add(GetAddress());
        },
        child: Obx(() => authController.logging_in.value == "true"
            ? SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                ),
              )
            : Icon(Icons.done)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: name,
                  focusNode: nameFocus,
                  decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(borderSide: BorderSide())),
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(contactFocus);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                    controller: contact,
                    focusNode: contactFocus,
                    decoration: InputDecoration(
                        hintText: 'Contact',
                        border: OutlineInputBorder(borderSide: BorderSide())),
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(pincodeFocus);
                    }),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                    controller: pincode,
                    focusNode: pincodeFocus,
                    decoration: InputDecoration(
                        hintText: 'Pincode',
                        border: OutlineInputBorder(borderSide: BorderSide())),
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(localityFocus);
                    }),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                    controller: locality,
                    focusNode: localityFocus,
                    decoration: InputDecoration(
                        hintText: 'Locality',
                        border: OutlineInputBorder(borderSide: BorderSide())),
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(addressFocus);
                    }),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                    controller: address,
                    focusNode: addressFocus,
                    decoration: InputDecoration(
                        hintText: 'Address',
                        border: OutlineInputBorder(borderSide: BorderSide())),
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(cityFocus);
                    }),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                    controller: city,
                    focusNode: cityFocus,
                    decoration: InputDecoration(
                        hintText: 'City',
                        border: OutlineInputBorder(borderSide: BorderSide())),
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(stateFocus);
                    }),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: state,
                  focusNode: stateFocus,
                  decoration: InputDecoration(
                      hintText: 'State',
                      border: OutlineInputBorder(borderSide: BorderSide())),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
