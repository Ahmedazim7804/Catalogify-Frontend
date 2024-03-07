import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inno_hack/provider/user_provider.dart';
import 'package:inno_hack/screens/widgets/overlay_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OthersDetailScreen extends StatefulWidget {
  const OthersDetailScreen({super.key});

  @override
  State<OthersDetailScreen> createState() => _OthersDetailScreenState();
}

class _OthersDetailScreenState extends State<OthersDetailScreen> {
  final OverlayPortalController overlayPortalController =
      OverlayPortalController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? image;

  bool nameIsValid = false;
  bool phoneIsValid = false;

  bool showPhoneErrorText = false;
  bool showNameErrorText = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void next() async {
    if (inputsAreValid) {
      context.read<UserProvider>().name = nameController.text;

      if (image != null) {
        FirebaseStorage firebaseStorage = FirebaseStorage.instance;
        final Reference refrence = firebaseStorage.ref().child(
            'user/${context.read<UserProvider>().uid}_profile_image.jpg');

        await refrence.putFile(File(image!));
      }

      await context.read<UserProvider>().createUser();
      context.go('/home_page');
    }
  }

  void nameValidation(String value) {
    setState(() {
      if (value.length >= 3) {
        nameIsValid = true;
        setState(() {
          showNameErrorText = false;
        });
      } else {
        nameIsValid = false;
      }
    });
  }

  void phoneValidation(String value) {
    setState(() {
      if (value.length == 10) {
        phoneIsValid = true;
        setState(() {
          showPhoneErrorText = false;
        });
      } else {
        phoneIsValid = false;
      }
    });
  }

  bool get inputsAreValid {
    if (!nameIsValid) {
      setState(() {
        showNameErrorText = true;
      });
      return false;
    }

    if (!phoneIsValid) {
      setState(() {
        showPhoneErrorText = true;
      });
      return false;
    }

    return true;
  }

  void addImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result != null) {
      image = result.files[0].path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfcfcfc),
      body: OverlayPortal(
        controller: overlayPortalController,
        overlayChildBuilder: overlayChildBuilder,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              Stack(
                children: [
                  Positioned(
                    child: Container(
                        width: 48 * 2,
                        height: 48 * 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48),
                        ),
                        child: image == null
                            ? Image.asset(
                                'assets/images/default_user.png',
                              )
                            : ClipOval(child: Image.file(File(image!)))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black87,
                      ),
                      child: InkWell(
                        onTap: addImage,
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // Image.asset(
              //   'assets/images/icon.png',
              //   color: Colors.teal,
              // ),
              Text(
                "Getting started!✌️",
                style: GoogleFonts.dmSans(
                    fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  "Look like you are new to us! Create an account for a complete experience.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mulish(
                      color: const Color(0xFF8e8ea9),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: TextField(
                  controller: nameController,
                  onChanged: nameValidation,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: nameIsValid
                          ? SvgPicture.asset(
                              'assets/images/icon.svg',
                              height: 20,
                              width: 20,
                            )
                          : const SizedBox.shrink(),
                    ),
                    errorText:
                        showNameErrorText ? "Please Enter correct name." : null,
                    labelStyle: GoogleFonts.mulish(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                      height: 0.06,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: TextField(
                  controller: phoneController,
                  onChanged: phoneValidation,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixText: "+91 ",
                    labelText: 'Phone Number',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: phoneIsValid
                          ? SvgPicture.asset(
                              'assets/images/icon.svg',
                              height: 20,
                              width: 20,
                            )
                          : const SizedBox.shrink(),
                    ),
                    errorText: showPhoneErrorText
                        ? "Phone Number should be 10 digits long."
                        : null,
                    labelStyle: GoogleFonts.mulish(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                      height: 0.06,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                    onPressed: next,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Next",
                      style: GoogleFonts.mulish(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 0.06,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
