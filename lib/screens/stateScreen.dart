import 'package:flutter/material.dart';
import '../utils/scrnUtils.dart';
import '../models/stateModels.dart';
import '../global/app.dart';
import '../screens/cityScreen.dart';

class StateScreen extends StatefulWidget {
  final maleOrFemale;
  final userName;
  StateScreen({this.maleOrFemale, this.userName});
  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  var stateController = TextEditingController();
  List searchStateName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.SelectStateTxt),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: StateSearch(stateName));
              }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: stateName.length,
              itemBuilder: (BuildContext context, int index) {
                var myData = stateName[index];
                return ListTile(
                  onTap: () {
                    getNewScreen(
                        context,
                        CityScreen(
                          userName: this.widget.userName,
                          cityNames: myData.cityName,
                          name: myData.name,
                          maleOrFemale: this.widget.maleOrFemale,
                          stateName: myData.name,
                        ));
                  },
                  title: Text(myData.name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StateSearch extends SearchDelegate<StateModel> {
  final stateList;
  StateSearch(this.stateList);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final myList = query.isEmpty
        ? stateList
        : stateList
            .where((u) => (u.name.toLowerCase().contains(query.toLowerCase()) ||
                u.name.toLowerCase().contains(query.toLowerCase())))
            .toList();
    return myList.isEmpty
        ? Center(child: Text("No result Found"))
        : ListView.builder(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 70),
            shrinkWrap: true,
            itemCount: myList.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              var myData = myList[index].name;
              return ListTile(title: Text(myData.toString()));
            },
          );
  }
}
