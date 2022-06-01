import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipcook/src/blocs/status.dart';
//////import 'dart:collection'; // nouveaux types de listes comme UnmodifiableListView
import 'dart:convert'; // pour decoder la r´eponse http
// import '../models/item_login_model/login_item_model.dart';
// import '../models/data/profiles.dart' as data;
import '../models/item_login_model/login_item_model.dart';

class ProfileProvider with ChangeNotifier {
  final String host = 'http://localhost:80';
  // Variable priv´ee pour qu'elle ne puisse pas ^etre modifi´ee par
  // les widgets qui l'utilisent
  /////late LoginItemModel _profiles;
  // Getter pour l'acc`es en lecture
  // Pas de modificiation possible gr^ace au type UnmodifiableListView
  /////////UnmodifiableListView<LoginItemModel> get profiles => UnmodifiableListView(_profiles);
  // M´ethode pour aller chercher des donn´ees dans la base de donn´ees
  // via le serveur en local
  Future<dynamic> fetchData(String login, String password) async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/profiles'));
      if (response.statusCode == 200) {
        return LoginItemModel.fromJson(json.decode(response.body));
      } else {
        // If that call was not successful, throw an error.
        return false;
      }
    } catch (e) {
      //rethrow;
      throw Exception(e);
    }
  }

  Future<dynamic> fetchDataR(String login, String password, String name, String cpass) async {
    try {
      http.Response response = await http.post(Uri.parse('$host/api/profiles'));
      if (response.statusCode == 200) {
        return LoginItemModel.fromJson(json.decode(response.body));
      } else {
        // If that call was not successful, throw an error.
        return false;
      }
    } catch (e) {
      //rethrow;
      throw Exception(e);
    }
  }
}