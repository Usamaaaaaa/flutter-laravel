// ignore_for_file: unused_import, avoid_print

import 'dart:collection';
import 'dart:convert';

import 'package:fllutter_1/controllers/insertcart.dart';
import 'package:fllutter_1/models/profileModel.dart';
import 'package:http/http.dart' as http;

class ProfileCurd {
  ////////// get user profile data from api  ////////
  getProfile(id) async {
    // print(id);
    var res = await InsertCart().getData(id, 'getprofile');
    List<dynamic> bod = json.decode(res.body);
    bod.map((e) => Profile.fromMap(e)).toList();
  }
}
