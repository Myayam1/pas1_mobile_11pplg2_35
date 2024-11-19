import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_35/models/team_model.dart';
import 'package:pas1_mobile_11pplg2_35/pages/details_page.dart';

import '../controllers/database_controller.dart';

class SimpleCard extends StatelessWidget {
  final TeamModel model;
  const SimpleCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final DatabaseController controller = Get.find();
    return Obx(() {
      return InkWell(
        onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(model: model))); },
        child: Card(
          margin: EdgeInsets.all(16.0),
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Image on the far left
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    model.urlBadge,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),

                // Text next to the image
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.strName,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          model.strLocation,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Like button (star icon) on the far right
                IconButton(
                  icon: Icon(
                    model.isSaved.value ? Icons.favorite : Icons.favorite_border_outlined,
                    color: Colors.deepOrange,
                  ),
                  onPressed: () {
                    if (model.isSaved.value) {
                      model.isSaved.value = false;
                      controller.deleteSavedTeam(model);
                    } else {
                      model.isSaved.value = true;
                      controller.saveTeam(model);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
