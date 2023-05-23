// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  int? productId;
  int? categoryId;
  String? categoryName; //db de yok
  String? productName;
  int? productPrice;
  String? productLink;
  String? productExplane; //?
  int? productImport; //?
  String? productPlanDate; //?
  String? productCreateDate;
  Product({
    this.categoryId,
    this.productName,
    this.productPrice,
    this.productLink,
    this.productExplane,
    this.productImport,
    this.productPlanDate,
    this.productCreateDate,
  });
  Product.withID({
    this.productId,
    this.categoryId,
    this.productName,
    this.productPrice,
    this.productLink,
    this.productExplane,
    this.productImport,
    this.productPlanDate,
    this.productCreateDate,
  });
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['productId'] = productId;
    map['categoryId'] = categoryId;
    map['productName'] = productName;
    map['productPrice'] = productPrice;
    map['productLink'] = productLink;
    map['productExplane'] = productExplane;
    map['productImport'] = productImport;
    map['productPlanDate'] = productPlanDate;
    map['productCreateDate'] = productCreateDate;
    return map;
  }

  Product.fromMap(Map<String, dynamic> map) {
    productId = map['productId'];
    categoryId = map['categoryId'];
    categoryName = map['categoryName']; //db de yok
    productName = map['productName'];
    productPrice = map['productPrice'];
    productLink = map['productLink'];
    productExplane = map['productExplane'];
    productImport = map['productImport'];
    productPlanDate = map['productPlanDate'];
    productCreateDate = map['productCreateDate'];
  }

  @override
  String toString() {
    return 'Product(productId: $productId, categoryId: $categoryId, categoryName: $categoryName, productName: $productName, productPrice: $productPrice, productLink: $productLink, productExplane: $productExplane, productImport: $productImport, productPlanDate: $productPlanDate, productCreateDate: $productCreateDate)';
  }
}
