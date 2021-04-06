import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  Loading() : super(key: UniqueKey());
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
