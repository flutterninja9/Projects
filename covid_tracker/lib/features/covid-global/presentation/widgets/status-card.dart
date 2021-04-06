import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String lable;
  final Color color;
  final String value;
  const StatusCard({
    Key key,
    @required this.color,
    @required this.lable,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Card(
        elevation: 2,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 25, bottom: 25, left: 30, right: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lable,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: color,
                ),
              ),
              Text(
                value,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
