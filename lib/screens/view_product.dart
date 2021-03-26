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
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xff53855E),
              Color(0xff53855E),
              Colors.white,
              Colors.white
            ])),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 25, 18, 50),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.product.productName,
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 25,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Hero(
                          tag: widget.product.productId,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(widget.product.productImage),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                elevation: 10,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Color(0xffD6FADC).withOpacity(.4),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.product.productBrand),
                      Text(widget.product.productCost)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 25,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffD6FADC).withOpacity(.4),
                      borderRadius: BorderRadius.circular(15)),
                  height: 500,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.product.productName),
                      Text(widget.product.productBrand),
                      Text(widget.product.productCost)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
