import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inno_hack/core/constants.dart';
import 'package:inno_hack/data/post_endpoints.dart';
import 'package:inno_hack/models/catalog.dart';
import 'package:inno_hack/screens/widgets/SingleProduct.dart';

import 'package:inno_hack/utilities/constants.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key, required this.catalog}) : super(key: key);
  final Catalog catalog;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  void _showsingleproduct() {
    showModalBottomSheet(
        useSafeArea: true,
        enableDrag: false,
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleProduct(catalog: widget.catalog));
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) => deletePost(widget.catalog.postId!),
      background: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.red,
          ),
          child: const Row(
            children: [
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
              Spacer(),
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ],
          )),
      child: GestureDetector(
        onTap: () {
          _showsingleproduct();
        },
        child: Card(
          color: Colors.teal.shade50,
          margin: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          // surfaceTintColor: Colors.transparent,
          // shadowColor: Colors.transparent,
          // color: Colors.transparent,
          shape: RoundedRectangleBorder(
            // side: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                      height: 80,
                      width: 80,
                      clipBehavior: Clip.hardEdge,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: Image.network(
                        widget.catalog.images.first,
                        fit: BoxFit.fill,
                      )),
                  title: Text(
                    widget.catalog.title,
                    overflow: TextOverflow.ellipsis,
                    style: kLargeTextStyle,
                  ),
                  subtitle: Text(
                    "₹${widget.catalog.price}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  trailing: IconButton(
                    onPressed: () => context.pushNamed('edit_catalog',
                        extra: widget.catalog),
                    icon: const Icon(Icons.edit),
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.teal),
                  ),
                  dense: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
