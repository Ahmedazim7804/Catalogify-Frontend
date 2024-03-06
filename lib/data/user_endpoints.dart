import 'dart:convert';
import 'dart:ffi';
import 'lib/models/catalog.dart';
import "package:http/http.dart" as http;

import 'base_endpoints.dart';

Future<bool> checkUser() async {
  final Uri uri = Uri.parse('${getBaseURL()}/user/check-user/');
  Map<String, String> header = await headers();
  final response = await http.get(uri, headers: header);
  if (response.statusCode == 200) {
    return true;
  } else if (response.statusCode == 404) {
    return false;
  } else {
    throw Exception(
        'Failed to load data from endpoint: ${response.statusCode} ${response.body}');
  }
}

Future<bool> createUserOnBackend(
    {required String email,
    required String name,
    required String firebaseUserId}) async {
  final Uri uri = Uri.parse('${getBaseURL()}/user/create-user/');
  final requestData = {
    "name": name,
    "firebase_user_id": firebaseUserId,
    "email": email
  };
  Map<String, String> header = await headers();
  final response =
      await http.post(uri, headers: header, body: jsonEncode(requestData));
  print(response.statusCode);
  if (response.statusCode == 200) {
    return true;
  } else if (response.statusCode == 417 || response.statusCode == 409) {
    return false;
  } else {
    throw Exception(
        'Failed to load data from endpoint: ${response.statusCode} ${response.body}');
  }
}

Future<dynamic> getUser() async {
  final Uri uri = Uri.parse('${getBaseURL()}/user/get-user/');
  Map<String, String> header = await headers();
  final response = await http.get(uri, headers: header);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception(
        'Failed to load data from endpoint: ${response.statusCode} ${response.body}');
  }
}

Future<bool> addFeedback(int rating, String feedback) async {
  final Uri uri = Uri.parse('${getBaseURL()}/user/add-feedback/');
  final requestData = {"rate": rating, "comment": feedback};
  Map<String, String> header = await headers();
  final response =
      await http.post(uri, headers: header, body: jsonEncode(requestData));
  if (response.statusCode == 200) {
    return true;
  } else {
    throw Exception(
        'Failed to load data from endpoint: ${response.statusCode} ${response.body}');
  }
}

Future<dynamic> getUserByID(String userID) async {
  final Uri uri = Uri.parse('${getBaseURL()}/user/$userID/fetch-user-by-id/');
  Map<String, String> header = await headers();
  final response = await http.get(uri, headers: header);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception(
        'Failed to load data from endpoint: ${response.statusCode} ${response.body}');
  }
}

Future<bool> updateUser(String name, String phone, String email) async {
  final Uri uri = Uri.parse('${getBaseURL()}/user/update-user/');
  final requestData = {};
  if (name != "") {
    requestData["name"] = name;
  }
  if (email != "") {
    requestData["email"] = email;
  }
  if (requestData.isEmpty) {
    return false;
  }
  Map<String, String> header = await headers();
  final response =
      await http.post(uri, headers: header, body: jsonEncode(requestData));
  if (response.statusCode == 200) {
    return true;
  } else {
    print(response.body);
    return false;
  }
}

Future<bool> createPost(Catalog catalog) async {
  final Uri uri = Uri.parse('${getBaseURL()}/user/new-post/');
  final requestData = {
    "title": catalog.title,
    "cost": catalog.price,
    "category": catalog.category.value,
    "description": catalog.description,
    "brand": catalog.brand,
    "warranty_months": catalog.warranty,
    "return_days": catalog.returnPeriod,
    "seller_location": catalog.state,
    "images": catalog.images,
    "in_box": Null
  };
  Map<String, String> header = await headers();
  final response = await http.post(uri, headers: header, body: jsonEncode(requestData));
  if (response.statusCode == 200) {
    return true;
  } else {
    print(response.body);
    return false;
  }
}
