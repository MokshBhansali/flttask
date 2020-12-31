import 'package:flutter/material.dart';
import '../global/app.dart';

class UserDetailScreen extends StatefulWidget {
  final id;
  final name;
  final maleOrFemale;
  final userName;
  final stateName;
  final cityName;
  UserDetailScreen({
    this.id,
    this.maleOrFemale,
    this.name,
    this.userName,
    this.cityName,
    this.stateName,
  });
  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.UserDetailTxt),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  AppString.UserNameTxt,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(this.widget.maleOrFemale == 0
                    ? AppString.MaleTxt
                    : AppString.MrsTxt),
                Text(this.widget.userName ?? "")
              ],
            ),
            Row(
              children: [
                Text(
                  AppString.StateTxt,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(this.widget.stateName ?? "")
              ],
            ),
            Row(
              children: [
                Text(
                  AppString.CityTxt,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(this.widget.cityName ?? "")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
