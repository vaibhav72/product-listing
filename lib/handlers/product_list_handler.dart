import 'dart:convert' as convert;
import 'dart:math';

import 'package:assignment/models/product_model.dart';
import 'package:assignment/util/constants.dart';
import 'package:assignment/util/meta_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:http/http.dart' as http;

Map<String, String> icons = {
  "Industrial": MetaIcons.industrial,
  "Garden": MetaIcons.garden,
  "Movies": MetaIcons.movie,
  "Electronics": MetaIcons.electronics,
  "Clothing": MetaIcons.clothes,
  "Books": MetaIcons.books,
  "Outdoors": MetaIcons.outdoors,
  "Baby": MetaIcons.baby,
  "Automotive": MetaIcons.baby,
  "Computers": MetaIcons.computer,
  "Health": MetaIcons.health,
  "Grocery": MetaIcons.grocery,
  "Beauty": MetaIcons.games,
  "Toys": MetaIcons.toys,
  "Sports": MetaIcons.sports,
  "Games": MetaIcons.games,
  "Music": MetaIcons.music,
  "Jewelery": MetaIcons.jewellery,
  "Shoes": MetaIcons.shoes,
  "Tools": MetaIcons.tools,
  "Kids": MetaIcons.kids,
  "Home": MetaIcons.home,
};

class ProductListService {
  static Future<List<Product>> getProducts() async {
    List<Product> productList = [];
    List<String> category = [];
    http.Response response = await http.get(Uri.parse(Constants.URL));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      for (var product in jsonResponse) {
        productList.add(Product(
            productId: product['productId'],
            productColor: product['productColor'],
            productAvailability: product['productAvailability'],
            productBrand: product['productBrand'],
            productCategory: product['productCategory'],
            productCost: product['productCost'],
            productImage: product['productImage'],
            productLaunchDate: product['productLaunchDate'],
            productMaterial: product['productMaterial'],
            productName: product['productName'],
            productSummary: product['productSummary'],
            categoryIcon: icons[product['productCategory'].toString()]));
      }
      print(icons);
      return productList;
    }
  }
}
