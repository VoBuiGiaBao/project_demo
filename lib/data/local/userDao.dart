import 'package:aina_assignment/models/user_model.dart';
import 'package:aina_assignment/data/db_helper.dart';

class UserDao {
  static final String tableName = "user";
  static final String login = "login";
  static final String id = "id";
  static final String avatarUrl = "avatar_url";
  static final String htmlUrl = "html_url";
  static final String name = "name";
  static final String location = "location";
  static final String bio = "bio";
  static final String publicRepos = "public_repos";
  static final String followers = "followers";
  static final String following = "following";

  static Future<int> insert(User value) async {
    return await DbHelper.db.insert(tableName, value.toJson());
  }

  static Future<int> update(User value) async {
    return await DbHelper.db
        .update(tableName, value.toJson(), where: "id = ${value.id}");
  }

  static Future<int> updateProfile(User value) async {
    return await DbHelper.db.update(tableName, value.toProfileJson(),
        where: "id = ${int.parse(value.login)}");
  }

  static Future<bool> checkUserById(int _id) async {
    List<Map<String, dynamic>> results = await DbHelper.db
        .query(tableName, where: "${id} LIKE '$_id'", limit: 1);
    return results.length > 0 ? true : false;
  }

  static Future<User> getById(int _id) async {
    List<Map<String, dynamic>> results = await DbHelper.db
        .query(tableName, where: "${id} LIKE '$_id'", limit: 1);
    return User.fromResult(results[0]);
  }

  static Future<List<User>> getAll() async {
    var listMap = await DbHelper.db.query(tableName, orderBy: '$id DESC');
    return listMap.map((jsonRaw) => User.fromJson(jsonRaw)).toList();
  }
}
