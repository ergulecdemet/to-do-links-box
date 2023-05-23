// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_links/constants/my_divider.dart';
import 'package:my_links/screens/home/widgets/category_add.dart';
import 'package:my_links/screens/home/widgets/link_add_floating.dart';
import 'package:sizer/sizer.dart';

import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/space/horizontal_space.dart';
import 'package:my_links/constants/space/vertical_space.dart';
import 'package:my_links/constants/text_style.dart';
import 'package:my_links/model/product.dart';
import 'package:my_links/screens/category/category.dart';
import 'package:my_links/screens/home/widgets/custom_todo_box.dart';
import 'package:my_links/utils/database_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> allProduct = [];
  DatabaseHelper? databaseHelper;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // List<bool> tick = List.generate(productNameList.length, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors!.transparentColor,
        elevation: 0,
        title: Center(
          child: Text(
            "TO-DO LİNKS",
            style: appTextStyles!.sp18(
              context,
              appColors!.blackColor,
              FontWeight.w700,
            ),
          ),
        ),
      ),
      floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            backgroundColor: appColors!.primaryColor,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const FloatingSimpleDialog();
                },
              );
            },
            tooltip: "Link Ekle",
            child: Icon(
              Icons.add,
              size: 35.sp,
            ),
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const VerticalSpace(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Toplam fiyat : ",
                    style: appTextStyles!.sp12(
                        context,
                        appColors!.greyTextColor.withOpacity(0.3),
                        FontWeight.w600),
                  ),
                  Text(
                    "${totalPrice()} TL",
                    style: appTextStyles!
                        .sp12(context, appColors!.tickColor, FontWeight.w600),
                  ),
                  const HorizontalSpace(width: 20),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CategoryScreen()));
                          },
                          child: const Text("Kategorileri Listele")),
                      const CategoryButtonAdd()
                    ],
                  ),
                ],
              ),
            ),
            const MyDivider(),
            const VerticalSpace(height: 20),
            (databaseHelper == null)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : FutureBuilder(
                    future: databaseHelper!.getProductList(),
                    builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        allProduct = snapshot.data!;
                        sleep(const Duration(milliseconds: 500));

                        return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: allProduct.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    child: CustomToDoBox(
                                        price: allProduct[index].productPrice,
                                        link: allProduct[index]
                                            .productLink
                                            .toString(),
                                        tick: false,
                                        name: allProduct[index]
                                            .productName
                                            .toString(),
                                        date: allProduct[index]
                                            .productCreateDate
                                            .toString(),
                                        import: allProduct[index]
                                            .productImport
                                            .toString(),
                                        detail: allProduct[index]
                                            .productExplane
                                            .toString()),
                                  ),
                                  const VerticalSpace(height: 10),
                                ],
                              );
                            });
                      } else {
                        return const Text("Yükleniyor");
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }

  int totalPrice() {
    var result = 0;
    for (var i = 0; i < allProduct.length; i++) {
      allProduct[i].productPrice != null
          ? result += int.parse(allProduct[i].productPrice.toString())
          : result += 0;
    }
    return result;
  }
}
