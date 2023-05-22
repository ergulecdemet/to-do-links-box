// ignore_for_file: public_member_api_docs, sort_constructors_first

class MyCategory {
  int? categoryId;
  String? categoryName;

  MyCategory({this.categoryName});
  MyCategory.withID({this.categoryId, this.categoryName});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['categoryId'] = categoryId;
    map['categoryName'] = categoryName;

    return map;
  }

  MyCategory.fromMap(Map<String, dynamic> map) {
    categoryId = map['categoryId'];
    categoryName = map['categoryName'];
  }

  @override
  String toString() {
    return 'Category(categoryId: $categoryId, categoryName: $categoryName)';
  }
}
