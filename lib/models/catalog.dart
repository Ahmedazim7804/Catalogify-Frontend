import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:inno_hack/core/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:inno_hack/data/user_endpoints.dart';
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
      this.userId,
      required this.images});

  final String title;
  final String? userId;
  final int price;
  final Categories category;
  final String description;
  final String brand;
  final int warranty;
  final int returnPeriod;
  final String state;
  List<dynamic> images;

  void uploadCatalog() async {
    images = await uploadImagesToFirebase();
    await createPost(this);
  }

  Future<List<String>> uploadImagesToFirebase() async {
    const uuid = Uuid();

    final List<String> downloadPaths = [];

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;

    final Reference refrence =
        firebaseStorage.ref().child('user/$userId/${uuid.v1()}.jpg');

    for (final String image in images) {
      TaskSnapshot taskSnapshot = await refrence.putFile(File(image));
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      downloadPaths.add(downloadUrl);
    }

    return downloadPaths;
  }
}
