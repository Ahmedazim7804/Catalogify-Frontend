import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inno_hack/core/validators.dart';
import 'package:inno_hack/screens/widgets/text_edit_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AddCatalog extends StatefulWidget {
  const AddCatalog({super.key});

  @override
  State<AddCatalog> createState() => _AddCatalogState();
}

class _AddCatalogState extends State<AddCatalog> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  InputDecoration getInputDecoration(String text) {
    return InputDecoration(
      labelText: text,
      labelStyle: const TextStyle(
        fontSize: 16,
        fontFamily: 'Epilogue',
        fontWeight: FontWeight.w500,
        height: 0.06,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      // errorText: showError ? widget.errorText : null,
      filled: true,
      fillColor: const Color(0xFFfafafa),
    );
  }

  void onSave() {
    final bool dataIsValid = formkey.currentState!.validate();
    print(dataIsValid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: onSave, child: const Icon(Icons.add)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImagesList(images: ['sd']),
              Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        validator: (value) => Validators.titleValidator(value),
                        decoration: getInputDecoration('Title'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Price",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextEditWidget(
                          onChanged: (String) {},
                          labelText: "Price",
                          errorText: "Error"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Category",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextEditWidget(
                          onChanged: (String) {},
                          labelText: "Title",
                          errorText: "Error"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Description",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextEditWidget(
                          onChanged: (String) {},
                          labelText: "Description",
                          errorText: "Error"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Brand",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextEditWidget(
                          onChanged: (String) {},
                          labelText: "Brand",
                          errorText: "Error"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Warranty",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextEditWidget(
                          onChanged: (String) {},
                          labelText: "Warranty",
                          errorText: "Error"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Return Period",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextEditWidget(
                          onChanged: (String) {},
                          labelText: "Warranty",
                          errorText: "Error"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Location",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextEditWidget(
                          onChanged: (String) {},
                          labelText: "Warranty",
                          errorText: "Error"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Box Contents",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextEditWidget(
                          onChanged: (String) {},
                          labelText: "Warranty",
                          errorText: "Error"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Categories",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextEditWidget(
                          onChanged: (String) {},
                          labelText: "Warranty",
                          errorText: "Error"),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ImagesList extends StatefulWidget {
  const ImagesList({super.key, required this.images});

  final List<String> images;

  @override
  State<ImagesList> createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: widget.images.length,
        itemBuilder: (context, index, realIndex) =>
            Image.asset('assets/images/default_image.png'),
        options: CarouselOptions());
  }
}