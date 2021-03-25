import 'package:assignment/models/product_model.dart';
import 'package:flutter/material.dart';

class ViewProduct extends StatefulWidget {
  final Product product;
  ViewProduct({this.product});
  @override
  _ViewProductState createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
          Hero(
            tag: widget.product.productId,
            child: Card(
              color: Colors.red,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.product.productImage),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
