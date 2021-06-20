import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/pexels.jpg'), fit: BoxFit.cover),
      ),
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: new Container(
          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.3)),
        ),
      ),
    );
  }
}
