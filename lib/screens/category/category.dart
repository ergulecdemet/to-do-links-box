import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_links/utils/database_helper.dart';

import '../../model/category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<MyCategory> allCategory = [];
  DatabaseHelper? databaseHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List allCategory = <MyCategory>[];
    databaseHelper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (databaseHelper == null)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : FutureBuilder(
                future: databaseHelper!.getCategoriesList(),
                builder: (context, AsyncSnapshot<List<MyCategory>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    allCategory = snapshot.data!;
                    sleep(const Duration(milliseconds: 500));
                    return ListView.builder(
                      itemCount: allCategory.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                              Text(allCategory[index].categoryName.toString()),
                        );
                      },
                    );
                  } else {
                    return const Text("Yükleniyor");
                  }
                },
              ));
  }
}
