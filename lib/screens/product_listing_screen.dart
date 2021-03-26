import 'dart:ui';

import 'package:assignment/handlers/product_list_handler.dart';
import 'package:assignment/models/product_model.dart';
import 'package:assignment/screens/view_product.dart';
import 'package:assignment/util/meta_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:random_color/random_color.dart';

class ProductListing extends StatefulWidget {
  @override
  _ProductListingState createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  final ScrollController scrollController = ScrollController();
  Color color1 = Color(0xff53855E);
  Color color2 = Color(0xff20AB87);
  Color color3 = Color(0xff00938B);
  Color color4 = Color(0xff007984);
  Color color5 = Color(0xff206072);
  Color color6 = Color(0xff2F4858);
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
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: 300,
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
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                color1,
                                color1,
                                color1,
                                color5,
                                color6
                              ])),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Text(
                                    productList[index].productName,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
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
                            Text(productList[index].productSummary),
                          ],
                        ),
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

  getImage(int index) {
    try {
      return FadeInImage.memoryNetwork(
          imageErrorBuilder:
              (BuildContext context, Object error, StackTrace trace) {
            print(error);
            return Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image(
                    height: 100,
                    width: 100,
                    image: AssetImage(MetaIcons.error)),
              ),
            );
          },
          fit: BoxFit.cover,
          placeholder: kTransparentImage,
          image: productList[index].productImage);
    } catch (NetworkImageLoadException) {
      print("hey");
    }
  }

  getImagePalette(ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor.color;
  }

  void getProductList() async {
    var products = await ProductListService.getProducts();

    setState(() {
      productList = products;
    });
  }
}
