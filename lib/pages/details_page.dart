import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_35/models/team_model.dart';

class DetailsPage extends StatelessWidget {
  final TeamModel model;
  const DetailsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.navigate_before, color: Colors.white,),
          onPressed: Get.back,
        ),
        title: Text("${model.strName} Details", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20.0),
              Center(child: Text(model.strName, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold))),
              SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(model.urlBadge, fit: BoxFit.fitWidth,)
              ),
              SizedBox(height: 20.0),
              Text(model.strDesc)
            ],
          ),
        ),
      ),
    );
  }
}
