import 'package:flutter/material.dart';

class Product {
  final String productId;
  final String productName;
  final String productCost;
  final String productBrand;
  final String productCategory;
  final String productColor;
  final String productMaterial;
  final String productImage;
  final String productAvailability;
  final String productLaunchDate;
  final String productSummary;
  final String categoryIcon;
  Product(
      {this.productId,
      this.productName,
      this.productCost,
      this.productBrand,
      this.productCategory,
      this.productColor,
      this.productMaterial,
      this.productImage,
      this.productAvailability,
      this.productLaunchDate,
      this.productSummary,
      this.categoryIcon});
}
