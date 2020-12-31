import 'cityModels.dart';

class StateModel {
  int id;
  String name;
  List<CityModel> cityName;
  StateModel({this.id, this.name, this.cityName});
}

List<StateModel> stateName = [
  StateModel(
    id: 1,
    name: "Andhra Pradesh",
    cityName: [
      CityModel(id: 1, name: "Visakhapatnam"),
      CityModel(id: 1, name: "Vijayawada"),
      CityModel(id: 1, name: "Guntur"),
    ],
  ),
  StateModel(
    id: 2,
    name: "Arunachal Pradesh",
    cityName: [
      CityModel(id: 1, name: "Adi"),
      CityModel(id: 1, name: "Mismi"),
      CityModel(id: 1, name: "Khamti"),
    ],
  ),
  StateModel(
    id: 3,
    name: "Assam",
    cityName: [
      CityModel(id: 1, name: "Guwahati"),
      CityModel(id: 1, name: "Jorhat"),
      CityModel(id: 1, name: "Nagaon"),
    ],
  ),
  StateModel(
    id: 4,
    name: "Bihar",
    cityName: [
      CityModel(id: 1, name: "Patna"),
      CityModel(id: 1, name: "Gaya"),
      CityModel(id: 1, name: "Munger"),
    ],
  ),
  StateModel(
    id: 5,
    name: "Chhattisgarh",
    cityName: [
      CityModel(id: 1, name: "Raipur"),
      CityModel(id: 1, name: "Bhilai"),
      CityModel(id: 1, name: "Korba"),
    ],
  ),
];
