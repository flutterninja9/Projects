import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class StatusCard extends StatelessWidget {
  final String lable;
  final Color color;
  final String value;
  final String logo;
  const StatusCard({
    Key key,
    @required this.color,
    @required this.lable,
    @required this.logo,
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
              const EdgeInsets.only(top: 30, bottom: 30, left: 30, right: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lable,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      color: color,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  WebsafeSvg.asset(
                    'assets/images/$logo',
                    height: 60,
                    width: 60,
                  ),
                ],
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
