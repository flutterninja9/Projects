import 'package:flutter/material.dart';

class LoadingFailed extends StatelessWidget {
  final String cause;
  LoadingFailed({
    @required this.cause,
  }) : super(key: UniqueKey());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.not_interested,
          color: Colors.redAccent,
          size: 60,
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'Oops! some error occured',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
