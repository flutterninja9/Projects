import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController _controller=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact(Under Development)",style: GoogleFonts.poppins(color: Colors.white),),
        elevation: 1,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          height: 400,
          width: 500,
          margin: EdgeInsets.only(left: 17,right: 17),
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text("Let's Connect!",style: GoogleFonts.poppins(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              Container(
                height: 62,
                width: 255,
                child: Center(
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: _controller,
                    onSubmitted: (text) {
                      print(text);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.montserrat(color: Colors.white),
                      hintText: "Enter your e-mail",
                      prefixIcon: Icon(Icons.email,color: Colors.white,),
                      suffixIcon: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.grey[200],
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
