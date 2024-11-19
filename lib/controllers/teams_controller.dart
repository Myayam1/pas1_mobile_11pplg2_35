import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_35/models/team_model.dart';
import 'package:pas1_mobile_11pplg2_35/services/api_service.dart';

class TeamsController extends GetxController {
  var isLoading = true.obs;
  var teamsList = <TeamModel>[].obs;

  @override
  void onInit() {
    fetchTeams();
    super.onInit();
  }

  void fetchTeams() async {
    try {
      isLoading(true);
      var teams = await ApiService().fetchTeams();
      teamsList.assignAll(teams);
    } finally {
      isLoading(false);
    }
  }
}