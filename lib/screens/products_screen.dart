import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:inno_hack/utilities/constants.dart";

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:

        ListView.builder(
              itemCount: 10,

              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    tileColor: Colors.pink.shade100,
                                leading: Image.network("https://th.bing.com/th/id/OIP.-FYmbg3G_Hbu6D5n69eElgHaIV?rs=1&pid=ImgDetMain") ,
                    title: Container(

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [

                            Text("Title", style: GoogleFonts.inter(
                                fontSize: 30, fontWeight: FontWeight.w700),),
                            Text(
                                "Descriptionjflsjlfdsjf;alsdk fdsfj dsl;fsjf;sdjf fsfj f;j s;df j;dsj",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w300, fontSize:15, ))
                          ],
                        )
                    ),
                  ),
                );
              }),


    );
  }
}