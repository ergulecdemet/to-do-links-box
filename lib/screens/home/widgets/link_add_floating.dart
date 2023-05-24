// import 'package:flutter/material.dart';
// import 'package:my_links/constants/button_bar.dart';
// import 'package:my_links/constants/colors.dart';
// import 'package:my_links/constants/custom_text_formfield.dart';
// import 'package:my_links/constants/space/vertical_space.dart';
// import 'package:my_links/constants/text_style.dart';
// import 'package:sizer/sizer.dart';

// import '../../../constants/is_link.dart';
// import '../../../model/category.dart';
// import '../../../model/product.dart';
// import '../../../utils/database_helper.dart';

// class FloatingSimpleDialog extends StatefulWidget {
//   const FloatingSimpleDialog({super.key});

//   @override
//   State<FloatingSimpleDialog> createState() => _FloatingSimpleDialogState();
// }

// class _FloatingSimpleDialogState extends State<FloatingSimpleDialog> {
//   var productFormKey = GlobalKey<FormState>();
//   int? categoryId = 1;
//   String? productName;
//   String? productLink;
//   String? productDetail;
//   int? productPrice = 0;
//   int? productImport = 0;
//   List<MyCategory> allCategory = [];
//   DatabaseHelper? databaseHelper;
//   String productDate = DateTime.now().toString();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     //allCategory = <MyCategory>[];
//     databaseHelper = DatabaseHelper();
//     // databaseHelper!.getCategory().then((value) {
//     //   for (Map readMap in value) {
//     //     allCategory.add(MyCategory.fromMap(readMap as Map<String, dynamic>));
//     //   }
//     // });
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       backgroundColor: appColors!.todoColor,
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
//       title: Text("Yeni Ürün Ekle",
//           style: appTextStyles!
//               .sp14(context, appColors!.primaryColor, FontWeight.bold)),
//       children: [
//         Padding(
//           padding: EdgeInsets.all(8.0.sp),
//           child: Form(
//               key: productFormKey,
//               child: Wrap(
//                 runSpacing: 2.h,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 4,
//                       horizontal: 24,
//                     ),
//                     margin: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                         border: Border.all(
//                             color: const Color.fromARGB(255, 27, 23, 23),
//                             width: 1),
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(10))),
//                     child: DropdownButtonHideUnderline(
//                         child: DropdownButton(
//                       items: categoryItems(),
//                       value: categoryId,
//                       onChanged: (selectCategoryID) {
//                         setState(() {
//                           categoryId = selectCategoryID!;
//                         });
//                       },
//                     )),
//                   ),
//                   CustomTextFormField(
//                     hintTex: "Ürün Linki ( https:// )",
//                     onSaved: (p0) {
//                       productLink = p0;
//                     },
//                     validator: (p0) {
//                       if (p0!.isEmpty) {
//                         return "Lütfen link giriniz";
//                       } else if (!isLink(p0)) {
//                         // could be !p0.contains("https://")
//                         return "Lütfen geçerli bir link giriniz";
//                       }
//                       return null;
//                     },
//                   ),
//                   CustomTextFormField(
//                     hintTex: "Ürün Adı",
//                     onSaved: (p0) {
//                       productName = p0;
//                     },
//                     validator: (p0) {
//                       if (p0!.isEmpty) {
//                         return "Lütfen ürün adı giriniz";
//                       }
//                       return null;
//                     },
//                   ),
//                   CustomTextFormField(
//                     hintTex: "Ürün Fiyatı",
//                     onSaved: (p0) {
//                       productPrice = int.parse(p0!);
//                     },
//                     validator: (p0) {
//                       if (p0!.isEmpty) {
//                         return "Lütfen ürün fiyatı giriniz";
//                       }
//                       return null;
//                     },
//                   ),
//                   const VerticalSpace(height: 8),
//                   CustomTextFormField(
//                     onSaved: (p0) {
//                       productDetail = p0;
//                     },
//                     hintTex: "Ürün Detayı",
//                     maxLines: 3,
//                     // validator: (p0) {
//                     //   if (p0!.isEmpty) {
//                     //     return "Lütfen  giriniz";
//                     //   }
//                     //   return null;
//                     // },
//                   ),
//                 ],
//               )),
//         ),
//         CustomButtonBar(
//           onPressed: () {
//             if (productFormKey.currentState!.validate()) {
//               productFormKey.currentState!.save();
//               databaseHelper!
//                   .addProduct(Product(
//                       categoryId: categoryId,
//                       productName: productName,
//                       productLink: productLink,
//                       productPrice: productPrice,
//                       productImport: productImport,
//                       productExplane: productDetail,
//                       productCreateDate: productDate.toString()))
//                   .then((value) {
//                 Navigator.pop(context);
//               }).then((value) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     backgroundColor: appColors!.primaryColor,
//                     content:
//                         const Text("Başarılı eklendi.. sayfayı yenileyiniz"),
//                   ),
//                 );
//               });
//               //must add fonction
//               print("ürün ekleniyor...");
//             }
//             setState(() {});
//           },
//           text0: "Vazgeç",
//           text1: "EKLE",
//         )
//       ],
//     );
//   }

//   List<DropdownMenuItem<int>>? categoryItems() {
//     return allCategory //tumKategorileri DropDownMenuItem lara dönüştürüyoruz
//         .map((category) => DropdownMenuItem<int>(
//             value: category.categoryId,
//             child: Text(
//               category.categoryName.toString(),
//               style: const TextStyle(fontSize: 16),
//             )))
//         .toList();
//   }
// }
