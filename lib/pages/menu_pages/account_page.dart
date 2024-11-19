import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_35/controllers/login_controller.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("My Account", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)
                    ),
                  color: Colors.green
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "lib/assets/avatar-placeholder.png",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Text(controller.username.value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0), textAlign: TextAlign.center),
                      SizedBox(height: 30.0,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.loginSuccess.value = false;
                    Get.toNamed("/login");
                  },
                  child: Text("Log Out", style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
