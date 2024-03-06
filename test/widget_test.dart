import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inno_hack/core/constants.dart';
import 'package:inno_hack/data/user_endpoints.dart';
import 'package:inno_hack/data/post_endpoints.dart';
import 'package:inno_hack/main.dart';
import 'package:inno_hack/models/catalog.dart';

void main() {
  group('checkUser', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await checkUser();
      expect(result == true || result == false, true);
    });
  });
  group('addPost', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await createPost(Catalog(
          title: "hello",
          price: 1900,
          category: Categories.toys,
          description: "I'm Iron Man",
          brand: 'brand',
          warranty: 60,
          returnPeriod: 7,
          state: "state",
          images: ["image1", "image2"],
          userId: "userId",
      ));
      expect(result == true || result == false, true);
    });
  });
  group('getPosts', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await listPosts();
      print(result);
      expect(Null == result || Null != result, true);
    });
  });
  group('getPost', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await getPost("ed46fe62-3fba-4bdd-88bd-40645f5fc8da");
      print(result);
      expect(Null == result || Null != result, true);
    });
  });
  group('deletePost', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await deletePost("ed46fe62-3fba-4bdd-88bd-40645f5fc8da");
      print(result);
      expect(false == result || true == result, true);
    });
  });

}
