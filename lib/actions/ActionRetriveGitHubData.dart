import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multiplatform_application/config/Config.dart';
import 'package:multiplatform_application/models/GitHubProfileModel.dart';

class ActionRetriveGitHubData {
  static getProfile() async {
    try {
      final res = await http.get(
        Uri.parse(Config.github),
      );

      // print(res.body);
      return GitHubProfileModel.fromJson(jsonDecode(res.body));
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getRepos() async {
    try {} catch (e) {
      print(e);
      return false;
    }
  }
}
