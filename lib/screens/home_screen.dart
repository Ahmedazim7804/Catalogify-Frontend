import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:inno_hack/screens/widgets/product_item.dart";
import "package:inno_hack/utilities/constants.dart";
import "package:go_router/go_router.dart";
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              color: Colors.teal.shade50,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Hi , Khushal Bhasin!",
                    style: GoogleFonts.inter(
                        fontSize: 19, fontWeight: FontWeight.w900),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgAAAA?rs=1&pid=ImgDetMain"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),

      bottomSheet: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add Products", style: kLargeTextStyle),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the border radius as needed
                    ),
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text(
                        "Add",
                        style: kNormalTextStyle,
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your Products",
              style: kLargeTextStyle,
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductItem(index: index);
                  }),
            )
          ],
        ),
        height: 420,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black, // Border color
            width: 1.0, // Border width
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
