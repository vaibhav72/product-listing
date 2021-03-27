import 'dart:ui';

import 'package:assignment/handlers/product_list_handler.dart';
import 'package:assignment/models/product_model.dart';
import 'package:assignment/screens/view_product.dart';
import 'package:assignment/util/meta_colors.dart';
import 'package:assignment/util/meta_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductListing extends StatefulWidget {
  @override
  _ProductListingState createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  final ScrollController scrollController = ScrollController();
  Color color1 = Color(0xff53855E);

  Color color7 = Color(0xffFFDF82);
  List<Product> productList = [];
  bool showReloading = false;

  @override
  void initState() {
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.7),
      appBar: AppBar(
        backgroundColor: color1,
        title: Text("your App Name"),
      ),
      body: productList != null && productList.length > 1
          ? Container(
              color: Colors.white70,
              child: Container(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: scrollController,
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return productTile(index);
                    }),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  productTile(int index) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ViewProduct(
                    product: productList[index],
                  ))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: MediaQuery.of(context).size.height * .38,
          child: Hero(
            tag: productList[index].productId,
            child: Material(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                fit: StackFit.passthrough,
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: getImage(index)),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .18,
                      width: double.infinity,
                      decoration:
                          buildBoxDecorationForPrimaryGadientContainer(),
                      child: ListView(
                        controller: ScrollController(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Text(
                                    productList[index].productName,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2),
                                  ),
                                ),
                                SvgPicture.asset(
                                  MetaIcons.rupee,
                                  height: 20,
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    productList[index].productCost,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(productList[index].productSummary),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Now in " +
                                  productList[index].productAvailability,
                              style: TextStyle(
                                  color: color7,
                                  fontSize: 15,
                                  letterSpacing: 1.4),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: CircleBorder(),
                        elevation: 10,
                        child: CircleAvatar(
                          backgroundColor: color1,
                          child: SvgPicture.asset(
                            productList[index].categoryIcon,
                            height: MediaQuery.of(context).size.height * .03,
                            width: MediaQuery.of(context).size.width * .03,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecorationForPrimaryGadientContainer() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              MetaColors.primaryColor,
              MetaColors.primaryColor,
              MetaColors.primaryColor,
              MetaColors.gradientColor2,
              MetaColors.gradientColor3
            ]));
  }

  Widget getImage(int index) {
    return FadeInImage.memoryNetwork(
        imageErrorBuilder:
            (BuildContext context, Object error, StackTrace trace) {
          print(error);
          return Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image(
                  height: 100, width: 100, image: AssetImage(MetaIcons.error)),
            ),
          );
        },
        fit: BoxFit.cover,
        placeholder: kTransparentImage,
        image: productList[index].productImage);
  }

  void getProductList() async {
    var products = await ProductListService.getProducts();
    setState(() {
      productList = products;
    });
  }
}
