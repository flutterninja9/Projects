import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class OrderReciept extends StatelessWidget {
  String mediaUrl;
  OrderReciept({@required this.mediaUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfPdfViewer.network(mediaUrl,
            canShowScrollHead: false, canShowScrollStatus: false));
  }
}
