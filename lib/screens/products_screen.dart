import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:inno_hack/screens/widgets/product_item.dart";

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Center(
          child: Text(
            "Catalogify",
            style: GoogleFonts.exo2(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const Placeholder();
              // return const ProductItem(catalog: Cata,);
            }),
      ),
    );
  }
}
