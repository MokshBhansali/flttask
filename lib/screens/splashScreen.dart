import 'package:flutter/material.dart';
import '../global/images.dart';
import '../global/colors.dart';
import '../utils/scrnUtils.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadNextScrn();
  }

  loadNextScrn() async {
    await Future.delayed(Duration(seconds: 3))
        .then((value) => nextScreenReplace(context, "/Home"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPlate.White,
      body: Center(
        child: Image.asset(
          MyImage.AppLogo,
          height: getScrnHeight(context, .3),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
