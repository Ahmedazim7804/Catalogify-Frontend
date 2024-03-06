import 'dart:convert';
import "package:http/http.dart" as http;
import 'base_endpoints.dart';

Future<dynamic> getPost(String postID) async {
  final Uri uri = Uri.parse('${getBaseURL()}/post/$postID/get-post/');
  Map<String, String> header = await headers();
  final response = await http.get(uri, headers: header);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception(
        'Failed to load data from endpoint: ${response.statusCode} ${response.body}');
  }
}

Future<dynamic> deletePost(String postID) async {
  final Uri uri = Uri.parse('${getBaseURL()}/post/$postID/delete-post/');
  Map<String, String> header = await headers();
  final response = await http.get(uri, headers: header);
  if (response.statusCode == 200) {
    return true;
  } else if (response.statusCode == 409 || response.statusCode == 404) {
    return false;
  } else {
    throw Exception(
        'Failed to load data from endpoint: ${response.statusCode} ${response.body}');
  }
}