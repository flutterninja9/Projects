import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => null,
              icon: Icon(Icons.screen_lock_portrait_outlined),
              color: Colors.purple,
              iconSize: 40,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => null,
              icon: Icon(Icons.home_filled),
              color: Colors.white,
              iconSize: 40,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => null,
              icon: Icon(Icons.account_circle),
              color: Colors.white,
              iconSize: 40,
            ),
          ),
        ],
      ),
    );
  }
}
