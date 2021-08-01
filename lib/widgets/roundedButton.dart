import 'package:flutter/material.dart';

import '../helper/palatte.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 120.0,
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32), color: Colors.blue),
            child: TextButton(
              onPressed: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                child: Text(
                  buttonText,
                  style: kButtonText,
                ),
              ),
            )),
      ],
    );
  }
}
