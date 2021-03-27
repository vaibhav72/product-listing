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
      this.productId,
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
      this.categoryIcon);

  Product.named(
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

  Product copyWith(
      {String productId,
      String productName,
      String productCost,
      String productBrand,
      String productCategory,
      String productColor,
      String productMaterial,
      String productImage,
      String productAvailability,
      String productLaunchDate,
      String productSummary,
      String categoryIcon}) {
    return Product.named(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productCost: productCost ?? this.productCost,
      productBrand: productBrand ?? this.productBrand,
      productColor: productColor ?? this.productColor,
      productCategory: productCategory ?? this.productCategory,
      productMaterial: productMaterial ?? this.productMaterial,
      productImage: productImage ?? this.productImage,
      productAvailability: productAvailability ?? this.productAvailability,
      productLaunchDate: productLaunchDate ?? this.productLaunchDate,
      productSummary: productSummary ?? this.productSummary,
    );
  }
}
