import 'package:assignment/models/product_model.dart';
import 'package:assignment/util/meta-styles.dart';
import 'package:assignment/util/meta_colors.dart';
import 'package:assignment/util/meta_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewProduct extends StatefulWidget {
  final Product product;
  ViewProduct({this.product});
  @override
  _ViewProductState createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    DateTime launchDate = DateTime.parse(widget.product.productLaunchDate);
    return Scaffold(
        body: Container(
          decoration: MetaStyles.buildBoxDecorationForGradientContainer(),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.5),
                            blurRadius: 3.0,
                            spreadRadius: 3,
                            offset: Offset(3, 2)),
                        BoxShadow(
                            color: MetaColors.primaryColor.withOpacity(.7),
                            blurRadius: 3.0,
                            spreadRadius: 3.0,
                            offset: Offset(-6, -2))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 25, 18, 50),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .2,
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 8, 12),
                                  child: Text(widget.product.productName,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30)),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: MetaStyles.buildBoxDecoration(
                                        MetaColors.primaryColor),
                                    child: Hero(
                                      transitionOnUserGestures: true,
                                      tag: widget.product.productId,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: FadeInImage.assetNetwork(
                                          image: widget.product.productImage,
                                          placeholder: MetaIcons.loading,
                                          imageErrorBuilder:
                                              (BuildContext context,
                                                  Object error,
                                                  StackTrace trace) {
                                            print(error);
                                            return Align(
                                              alignment: Alignment.topCenter,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Image(
                                                    height: 100,
                                                    width: 100,
                                                    image: AssetImage(
                                                        MetaIcons.error)),
                                              ),
                                            );
                                          },
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: SvgPicture.asset(
                                widget.product.categoryIcon,
                                height:
                                    MediaQuery.of(context).size.height * .04,
                                width: MediaQuery.of(context).size.width * .04,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        height: 150,
                        width: 100,
                        decoration: MetaStyles.buildBoxDecoration(
                            MetaColors.colorBlock1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Launched by',
                                style: TextStyle(
                                    color: MetaColors.colorBlock2,
                                    fontSize: 15),
                              ),
                              Text(
                                widget.product.productBrand,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              Text(
                                'on',
                                style: TextStyle(
                                    color: MetaColors.colorBlock2,
                                    fontSize: 15),
                              ),
                              Text(
                                launchDate.day.toString() +
                                    "/" +
                                    launchDate.month.toString() +
                                    "/" +
                                    launchDate.year.toString(),
                                style: TextStyle(
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        height: 150,
                        width: 100,
                        decoration: MetaStyles.buildBoxDecoration(
                            MetaColors.colorBlock2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Made of',
                              style: TextStyle(
                                  color: MetaColors.colorBlock1,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.product.productMaterial,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration:
                      MetaStyles.buildBoxDecoration(MetaColors.colorBlock3),
                  height: 500,
                  width: 100,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        controller: ScrollController(),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  MetaIcons.rupee,
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.product.productCost,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Product Description :",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Available in " +
                                  widget.product.productAvailability,
                              style: TextStyle(
                                  color: MetaColors.colorBlock2, fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Color: " + widget.product.productColor,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Category: " + widget.product.productCategory,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.product.productSummary,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: MediaQuery.of(context).size.height * .07,
          width: MediaQuery.of(context).size.width * .3,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Buy Now",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          decoration: MetaStyles.buildBoxDecoration(MetaColors.colorBlock2),
        ));
  }
}
