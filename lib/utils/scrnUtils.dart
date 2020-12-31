import 'package:flutter/material.dart';

void nextScreenReplace(context, page) {
  Navigator.pushReplacementNamed(context, page);
}

void nextScreen(context, page) {
  Navigator.pushNamed(context, page);
}

getScrnHeight(context, height) {
  return MediaQuery.of(context).size.height * height;
}

getScrnWidth(context, width) {
  return MediaQuery.of(context).size.width * width;
}

void getNewScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
