import 'package:flutter/material.dart';
import 'package:my_links/constants/colors.dart';
import 'package:my_links/model/category.dart';
import 'package:my_links/screens/home/widgets/category_create_button.dart';

import '../../../utils/database_helper.dart';

class CategoryButtonAdd extends StatefulWidget {
  const CategoryButtonAdd({super.key});

  @override
  State<CategoryButtonAdd> createState() => _CategoryButtonAddState();
}

class _CategoryButtonAddState extends State<CategoryButtonAdd> {
  List<MyCategory> allCategory = [];
  DatabaseHelper? databaseHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allCategory = <MyCategory>[];
    databaseHelper = DatabaseHelper();
    databaseHelper!.getCategory().then((value) {
      for (Map readMap in value) {
        allCategory.add(MyCategory.fromMap(readMap as Map<String, dynamic>));
      }
    });
  }

  var categoryFormKey = GlobalKey<FormState>();
  String? newCategoryName;

  @override
  Widget build(BuildContext context) {
    return CatgeoryCreateButton(
      formkey: categoryFormKey,
      onSaved: (newValue) {
        newCategoryName = newValue;
      },
      onPressed: () {
        if (categoryFormKey.currentState!.validate()) {
          categoryFormKey.currentState!.save();
          databaseHelper!
              .addCategory(MyCategory(categoryName: newCategoryName))
              .then((value) => Navigator.pop(context))
              .then((value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: appColors!.primaryColor,
                content: const Text("Başarılı eklendi.."),
              ),
            );
          });
          print("kategori ekleniyor...");
        }
      },
    );
  }
}
