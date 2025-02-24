// ignore_for_file: avoid_print

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traver_v2/core/models/model.dart';

class HomeController {
  Future getCategory() async {
    Uri url = Uri.parse("${dotenv.env['baseUrl']}/categories/");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login user = loginFromJson(prefs.getString("login")!);

    String token = "Bearer ${user.token}";

    try {
      final response = await http.get(url, headers: {"Authorization": token});
      if (response.statusCode == 200) {
        List<Categories> data = categoriesFromJson(response.body);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
