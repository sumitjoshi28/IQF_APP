import 'package:flutter/material.dart';
import 'package:iqf_app/helper/palatte.dart';
import 'package:iqf_app/widgets/backgroundImage.dart';

class OnBoardingPage extends StatefulWidget {
  final String name;
  const OnBoardingPage({
    Key? key,
    required this.name,
  }) : super(key: key);
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        "Welcome, " + widget.name,
                        style: kHeading,
                      ),
                    ),
                    Container(
                      child:
                          Text("Here is what you can do with", style: lHeading),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Image(
                          image: AssetImage('assets/images/mainlogo.png'),
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        )),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image(
                          image: AssetImage('assets/images/meditationpose.png'),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover),
                    ),
                    Container(
                        child: Text("Meditation", style: kBodyText),
                        padding: const EdgeInsets.only(top: 10, bottom: 10)),
                    Container(
                      child: Image(
                          image: AssetImage('assets/images/yogaasana.png'),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover),
                    ),
                    Container(
                        child: Text("Yogaasana", style: kBodyText),
                        padding: const EdgeInsets.only(top: 10, bottom: 10)),
                    Container(
                      child: Image(
                          image: AssetImage('assets/images/getinspired.png'),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover),
                    ),
                    Container(
                        child: Text("Get Inspired", style: kBodyText),
                        padding: const EdgeInsets.only(top: 10)),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
