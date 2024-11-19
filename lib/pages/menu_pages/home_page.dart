import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_35/controllers/teams_controller.dart';

import '../../controllers/database_controller.dart';
import '../../widgets/simple_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TeamsController controller = Get.find();
    final DatabaseController dbController = Get.find();
    dbController.loadSavedTeams();

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: null,
          title: Text("Home", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: controller.isLoading.value
              ? CircularProgressIndicator()
              : ListView.builder(
              itemCount: controller.teamsList.length,
              itemBuilder: (context, index) {
                final team = controller.teamsList[index];
                return SimpleCard(model: team);
              }
          ),
        ),
      );
    });
  }
}
