import '../models/cityModels.dart';
import '../screens/userDetailScreen.dart';
import '../utils/scrnUtils.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  final id;
  final List<CityModel> cityNames;
  final name;
  final maleOrFemale;
  final stateName;
  final userName;
  CityScreen(
      {this.id,
      this.maleOrFemale,
      this.name,
      this.cityNames,
      this.stateName,
      this.userName});
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.name ?? ""),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: StateSearch(this.widget.cityNames));
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: this.widget.cityNames.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var myCityName = this.widget.cityNames[index];
                return ListTile(
                  title: Text(myCityName.name),
                  onTap: () {
                    getNewScreen(
                      context,
                      UserDetailScreen(
                        cityName: myCityName.name,
                        stateName: this.widget.name,
                        userName: this.widget.userName.toString(),
                        maleOrFemale: this.widget.maleOrFemale,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StateSearch extends SearchDelegate {
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
