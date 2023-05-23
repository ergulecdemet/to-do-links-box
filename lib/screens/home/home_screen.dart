// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_links/constants/button_bar.dart';
import 'package:my_links/constants/custom_text_formfield.dart';
import 'package:my_links/model/category.dart';
import 'package:my_links/screens/home/widgets/category_create_button.dart';
import 'package:sizer/sizer.dart';

import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/space/horizontal_space.dart';
import 'package:my_links/constants/space/vertical_space.dart';
import 'package:my_links/constants/text_style.dart';
import 'package:my_links/model/product.dart';
import 'package:my_links/screens/category/category.dart';
import 'package:my_links/screens/home/widgets/custom_todo_box.dart';
import 'package:my_links/utils/database_helper.dart';

import '../../constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> allProduct = [];
  List<MyCategory> allCategory = [];
  DatabaseHelper? databaseHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allProduct = <Product>[];
    allCategory = <MyCategory>[];
    databaseHelper = DatabaseHelper();
    databaseHelper!.getCategory().then((value) {
      for (Map readMap in value) {
        allCategory.add(MyCategory.fromMap(readMap as Map<String, dynamic>));
      }
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var categoryFormKey = GlobalKey<FormState>();
  var productFormKey = GlobalKey<FormState>();
  int? categoryId = 1;
  String? productName;
  String? productLink;
  String? productDetail;
  static final import = ["⭐", "⭐⭐", "⭐⭐⭐"];
  String? selectImport;
  int? productPrice = 0;
  int? productImport = 0;
  String productDate = DateTime.now().toString();

  // List<bool> tick = List.generate(productNameList.length, (index) => false);
  String? newCategoryName;
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
                  return SimpleDialog(
                    backgroundColor: appColors!.todoColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.sp)),
                    title: Text("Yeni Ürün Ekle",
                        style: appTextStyles!.sp14(
                            context, appColors!.primaryColor, FontWeight.bold)),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: Form(
                            key: productFormKey,
                            child: Wrap(
                              runSpacing: 2.h,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 24,
                                  ),
                                  margin: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 27, 23, 23),
                                          width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                    items: categoryItems(),
                                    value: categoryId,
                                    onChanged: (selectCategoryID) {
                                      setState(() {
                                        categoryId = selectCategoryID!;
                                      });
                                    },
                                  )),
                                ),
                                // Container(
                                //   padding: const EdgeInsets.symmetric(
                                //       vertical: 4, horizontal: 24),
                                //   margin: const EdgeInsets.all(12),
                                //   decoration: BoxDecoration(
                                //       border: Border.all(
                                //           color: Colors.redAccent, width: 1),
                                //       borderRadius: const BorderRadius.all(
                                //           Radius.circular(10))),
                                //   child: DropdownButtonHideUnderline(
                                //       child: DropdownButton<int>(
                                //     items: import.map((oncelik) {
                                //       return DropdownMenuItem<int>(
                                //         value: import.indexOf(oncelik),
                                //         child: Text(
                                //           oncelik,
                                //           style: const TextStyle(fontSize: 24),
                                //         ), //gördüğü ilk değeri yazacak
                                //       );
                                //     }).toList(),
                                //     value: int.parse(selectImport!),
                                //     onChanged: (secilenOncelikID) {
                                //       setState(() {
                                //         selectImport =
                                //             secilenOncelikID!.toString();
                                //       });
                                //     },
                                //   )),
                                // ),
                                CustomTextFormField(
                                  hintTex: "Ürün Linki ( https:// )",
                                  onSaved: (p0) {
                                    productLink = p0;
                                  },
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return "Lütfen link giriniz";
                                    } else if (!isLink(p0)) {
                                      // could be !p0.contains("https://")
                                      return "Lütfen geçerli bir link giriniz";
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextFormField(
                                  hintTex: "Ürün Adı",
                                  onSaved: (p0) {
                                    productName = p0;
                                  },
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return "Lütfen ürün adı giriniz";
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextFormField(
                                  hintTex: "Ürün Fiyatı",
                                  onSaved: (p0) {
                                    productPrice = int.parse(p0!);
                                  },
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return "Lütfen ürün fiyatı giriniz";
                                    }
                                    return null;
                                  },
                                ),
                                const VerticalSpace(height: 8),
                                CustomTextFormField(
                                  onSaved: (p0) {
                                    productDetail = p0;
                                  },
                                  hintTex: "Ürün Detayı",
                                  maxLines: 3,
                                  // validator: (p0) {
                                  //   if (p0!.isEmpty) {
                                  //     return "Lütfen  giriniz";
                                  //   }
                                  //   return null;
                                  // },
                                ),
                              ],
                            )),
                      ),
                      CutomButtonBar(
                        onPressed: () {
                          if (productFormKey.currentState!.validate()) {
                            productFormKey.currentState!.save();
                            databaseHelper!
                                .addProduct(Product(
                                    categoryId: categoryId,
                                    productName: productName,
                                    productLink: productLink,
                                    productPrice: productPrice,
                                    productImport: productImport,
                                    productExplane: productDetail,
                                    productCreateDate: productDate.toString()))
                                .then((value) {
                              Navigator.pop(context);
                              setState(() {});
                            });
                            //must add fonction
                            print("ürün ekleniyor...");
                          }
                        },
                        text0: "Vazgeç",
                        text1: "EKLE",
                      )
                    ],
                  );
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
                      CatgeoryCreateButton(
                        formkey: categoryFormKey,
                        onSaved: (newValue) {
                          newCategoryName = newValue;
                        },
                        onPressed: () {
                          if (categoryFormKey.currentState!.validate()) {
                            categoryFormKey.currentState!.save();
                            databaseHelper!
                                .addCategory(
                                    MyCategory(categoryName: newCategoryName))
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
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              child: Divider(
                thickness: 1.5,
                color: appColors!.blackColor.withOpacity(0.3),
              ),
            ),
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
    for (var i = 0; i < allCategory.length; i++) {
      result = (1 + result);
    }
    return result;
  }

  List<DropdownMenuItem<int>>? categoryItems() {
    return allCategory //tumKategorileri DropDownMenuItem lara dönüştürüyoruz
        .map((category) => DropdownMenuItem<int>(
            value: category.categoryId,
            child: Text(
              category.categoryName.toString(),
              style: const TextStyle(fontSize: 14),
            )))
        .toList();
  }
}
