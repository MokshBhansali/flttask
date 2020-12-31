import 'package:flutter/material.dart';
import '../global/app.dart';
import '../widgets/commonWidgets.dart';
import '../utils/scrnUtils.dart';
import '../global/colors.dart';
import 'stateScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  int selectedInt = 2;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldkey,
        appBar: AppBar(
          title: Text(AppString.HomeScrnTxt),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                myTxtFilled(
                    controller: nameController,
                    hint: AppString.EnterNameTxt,
                    valid: (val) {}),
                mySizedBox(height: 20, width: 0),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color:
                                  selectedInt == 0 ? ColorPlate.Blue : ColorPlate.White,
                              height: 50,
                              child: FlatButton(
                                onPressed: () {
                                  selectedInt = 0;
                                  setState(() {});
                                },
                                child: Text(AppString.MaleTxt),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          Expanded(
                            child: Container(
                              color:
                                  selectedInt == 1 ? ColorPlate.Blue : ColorPlate.White,
                              height: 50,
                              child: FlatButton(
                                onPressed: () {
                                  selectedInt = 1;
                                  setState(() {});
                                },
                                child: Text(AppString.FemaleTxt),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                authButton(
                    onTapped: () {
                      if (formKey.currentState.validate() &&
                          nameController.text.length != 0 &&
                          selectedInt != 2) {
                        getNewScreen(
                            context,
                            StateScreen(
                              maleOrFemale: selectedInt,
                              userName: nameController.text,
                            ));
                      } else {
                        scaffoldkey.currentState.showSnackBar(SnackBar(
                          content: Text(AppString.NameNullTxt),
                          backgroundColor: ColorPlate.Red,
                        ));
                      }
                    },
                    label: AppString.NextTxt),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
