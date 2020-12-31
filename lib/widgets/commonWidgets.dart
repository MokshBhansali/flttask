import 'package:flutter/material.dart';

SizedBox mySizedBox({@required height, @required width, Widget child}) {
  return SizedBox(
    height: double.parse("$height"),
    width: double.parse("$width"),
    child: child,
  );
}

myTxtFilled({String hint, valid, controller, onChanged}) {
  return TextFormField(
    controller: controller,
    validator: valid,
    onChanged: onChanged,
    decoration: InputDecoration(
      hintText: hint ?? "",
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(),
    ),
  );
}

Container authButton({Function onTapped, String label}) {
  return Container(
    height: 40,
    decoration: BoxDecoration(
      color: Colors.blue[900],
      borderRadius: BorderRadius.circular(7),
    ),
    child: RaisedButton(
      onPressed: onTapped ?? () {},
      child: Text(label ?? ""),
      textColor: Colors.blue[900],
    ),
  );
}
