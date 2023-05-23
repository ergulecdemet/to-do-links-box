import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/space/vertical_space.dart';
import 'package:my_links/constants/text_style.dart';
import 'package:my_links/utils/database_helper.dart';
import 'package:sizer/sizer.dart';

import '../../model/category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<MyCategory> allCategory = [];
  int categoryId = 1;
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
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: appColors!.transparentColor,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: appColors!.blackColor,
              )),
          title: Text(
            "Category List",
            style: appTextStyles!.sp18(
              context,
              appColors!.blackColor,
              FontWeight.w700,
            ),
          ),
        ),
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
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 30.sp,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: appColors!.todoColor)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          allCategory[index]
                                              .categoryName
                                              .toString(),
                                          style: appTextStyles!.sp14(
                                              context, appColors!.blackColor),
                                        )),
                                    IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        size: 18.sp,
                                      ),
                                      onPressed: () {
                                        databaseHelper!
                                            .deleteCategory(
                                          allCategory[index]
                                              .categoryId!
                                              .toInt(),
                                        )
                                            .then((value) {
                                          setState(() {});
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const VerticalSpace(height: 20)
                          ],
                        );
                        // return ListTile(
                        //   title:
                        //       Text(allCategory[index].categoryName.toString()),
                        // );
                      },
                    );
                  } else {
                    return const Text("Yükleniyor");
                  }
                },
              ));
  }
}
