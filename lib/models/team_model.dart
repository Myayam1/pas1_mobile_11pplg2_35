import 'package:get/get.dart';

class TeamModel {
  final String strName, strDesc, strLocation, urlBadge;
  RxBool isSaved = false.obs;

  TeamModel({required this.strName, required this.strDesc, required this.strLocation, required this.urlBadge});

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      strName: json["strTeam"],
      strDesc: json["strDescriptionEN"],
      strLocation: json["strLocation"],
      urlBadge: json["strBadge"]
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "strTeam": strName,
      "strDescriptionEN": strDesc,
      "strLocation": strLocation,
      "strBadge": urlBadge
    };
  }
}