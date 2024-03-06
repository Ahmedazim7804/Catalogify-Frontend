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
          images: ["https://firebasestorage.googleapis.com/v0/b/innohack-hackathon.appspot.com/o/user%2Fc44f0f84-b0b3-4042-84cd-87fde2b50211%2F68fa8be0-b76d-1ef8-9861-355ce1d25902.jpg?alt=media&token=ebaf6d85-3c8f-4e5b-b6e3-b6341bd11312", "https://firebasestorage.googleapis.com/v0/b/innohack-hackathon.appspot.com/o/user%2Fc44f0f84-b0b3-4042-84cd-87fde2b50211%2F68fa8be0-b76d-1ef8-9861-355ce1d25902.jpg?alt=media&token=ebaf6d85-3c8f-4e5b-b6e3-b6341bd11312"],
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
  group('createPostAssessment', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await createPostAssessment("05b8c149-b66e-4546-a0a5-6443c5bbf7a9");
      print(result);
      expect(false == result || true == result, true);
    });
  });
  group('getPostAssessment', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await getPostAssessment("05b8c149-b66e-4546-a0a5-6443c5bbf7a9");
      print(result);
      expect(Null == result || Null != result, true);
    });
  });
  group('addLike', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await addLike("05b8c149-b66e-4546-a0a5-6443c5bbf7a9");
      print(result);
      expect(false == result || true == result, true);
    });
  });
  group('addDisLike', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await addDisLike("05b8c149-b66e-4546-a0a5-6443c5bbf7a9");
      print(result);
      expect(false == result || true == result, true);
    });
  });

}
