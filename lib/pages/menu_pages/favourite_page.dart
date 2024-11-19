import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/database_controller.dart';
import '../../widgets/simple_card.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseController controller = Get.find();

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Favourites", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: controller.savedTeams.isNotEmpty ? ListView.builder(
            itemCount: controller.savedTeams.length,
            itemBuilder: (context, index) {
              final team = controller.savedTeams[index];
              return SimpleCard(model: team);
            }
          ) : Text("No favourite team yet."),
        ),
      );
    });
  }
}
