import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontWeight: FontWeight.w400, color: Colors.white, fontSize: 20);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No Internet ',
                style: style,
              ),
              Icon(
                Icons.wifi_off,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          Text(
            'Open Internet and Try Again',
            style: style,
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
