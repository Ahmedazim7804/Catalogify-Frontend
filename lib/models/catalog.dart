import 'dart:io';

import 'package:inno_hack/core/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:inno_hack/models/user.dart';

class Catalog {
  Catalog(
      {required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.brand,
      required this.warranty,
      required this.returnPeriod,
      required this.state,
      required this.userId,
      required this.images});

  final String title;
  final String userId;
  final int price;
  final Categories category;
  final String description;
  final String brand;
  final int warranty;
  final int returnPeriod;
  final String state;
  final List<String> images;

  void uploadCatalog() {}

  Future<List<String>> uploadImagesToFirebase() async {
    print("object");
    final List<String> downloadPaths = [];

    // FirebaseStorage firebaseStorage = FirebaseStorage.instance;

    // final Reference refrence = firebaseStorage.ref().child('user/$userId');

    // for (final String image in images) {
    //   TaskSnapshot taskSnapshot = await refrence.putFile(File(image));
    //   taskSnapshot.ref.getDownloadURL().then((downloadUrl) {
    //     downloadPaths.add(downloadUrl);
    //   });
    // }

    return downloadPaths;
  }
}
