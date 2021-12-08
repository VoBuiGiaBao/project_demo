import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class UserServices {
  static const apiUrl = "https://api.github.com";

  Future<bool> isNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    return [ConnectivityResult.mobile, ConnectivityResult.wifi]
            .any((element) => element == connectivityResult)
        ? true
        : false;
  }

  Future fetchUserList() async {
    await isNetwork().then((connection) {
      if (!connection) return false;
    });

    var url = Uri.parse(apiUrl + '/users');

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else
      return false;
  }

  Future fetchUserDetail(int id) async {
    await isNetwork().then((connection) {
      if (!connection) return false;
    });

    var url = Uri.parse(apiUrl + '/users/$id');

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else
      return false;
  }
}
