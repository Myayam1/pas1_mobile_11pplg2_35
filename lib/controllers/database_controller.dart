import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_35/controllers/teams_controller.dart';
import 'package:pas1_mobile_11pplg2_35/models/team_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseController extends GetxController {
  static Database? _db;
  var savedTeams = <TeamModel>[].obs;
  final TeamsController teamsController = Get.put(TeamsController());

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'team_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate:(db, version) async {
        await db.execute('''
          CREATE TABLE teams(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            strTeam TEXT,
            strDescriptionEN TEXT,
            strLocation TEXT,
            strBadge TEXT
          )
        ''');
      }
    );
  }

  Future<int> saveTeam(TeamModel team) async {
      var dbClient = await db;
      if (dbClient == null) {
        throw Exception("Database is not initialized.");
      }

      int result = await dbClient.insert('teams', team.toMap());
      loadSavedTeams();
      return result;
  }

  Future<void> loadSavedTeams() async {
    var dbClient = await db;
    if (dbClient == null) {
      throw Exception("Database is not initialized.");
    }

    List<Map<String, dynamic>> queryResult = await dbClient.query('teams');
    savedTeams.assignAll(queryResult.map((data) => TeamModel.fromJson(data)));

    savedTeams.forEach((team) => team.isSaved.value = true);
    Set<String> savedTeamNames = savedTeams.map((team) => team.strName).toSet();

    for (var team in teamsController.teamsList) {
      team.isSaved.value = savedTeamNames.contains(team.strName);
    }
  }

  Future<int> deleteSavedTeam(TeamModel team) async {
    var dbClient = await db;
    if (dbClient == null) {
      throw Exception("Database is not initialized");
    }

    int result = await dbClient.delete(
        'teams',
        where: 'strTeam = ?',
        whereArgs: [team.strName]
    );
    loadSavedTeams();
    return result;
  }
}