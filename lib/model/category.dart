// ignore_for_file: public_member_api_docs, sort_constructors_first

class Category {
  String? categoryId;
  String? categoryName;

  Category({this.categoryName});
  Category.withID({this.categoryId, this.categoryName});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['categoryId'] = categoryId;
    map['categoryName'] = categoryName;

    return map;
  }

  Category.fromMap(Map<String, dynamic> map) {
    categoryId = map['categoryId'];
    categoryName = map['categoryName'];
  }

  @override
  String toString() {
    return 'Category(categoryId: $categoryId, categoryName: $categoryName)';
  }
}
