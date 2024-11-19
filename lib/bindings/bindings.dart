import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_35/controllers/teams_controller.dart';

import '../controllers/database_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/navigation_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<NavigationController>(NavigationController());
    Get.put<DatabaseController>(DatabaseController());
    Get.put<TeamsController>(TeamsController());
  }
}