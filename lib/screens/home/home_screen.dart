import 'package:flutter/material.dart';
import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/text_style.dart';
import 'package:my_links/constants/space/vertical_space.dart';
import 'package:my_links/screens/home/widgets/custom_todo_box.dart';
import 'package:my_links/screens/home/widgets/link_add_floating.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> productNameList = [
  "Locosta Sarrrwdewfweferrrrrrrrrrrrrrrrat",
  "İnci Ayakkabı ",
  "Deniz Kolye",
  "Koton Mont"
];
List<String> productLinks = [
  "https://www.trendyol.com/daniel-klein/gumus-renk-kadin-kol-saati-p-696183871?boutiqueId=61&merchantId=551253&advertItems=eyJhZHZlcnRJZCI6ImNjZjg4MGVkLWFjZjMtNGQ1ZS1hMzVkLTJiOGYxODFlNWM2NSIsInNvcnRpbmdTY29yZSI6MC4wNzUwMTkyNjUwODk1MzUwNSwiYWRTY29yZSI6MC4wOTIxNjEyNTkzMjM3NTMxMywiYWRTY29yZXMiOnsiMSI6MC4wOTIxNjEyNTkzMjM3NTMxMywiMiI6MC4wNTYzNTEzNDA5Njk1MDQ3MX0sImNwYyI6MC44MTQwMDAwMDAwMDAwMDAxLCJtaW5DcGMiOjAuMDEsImVDcGMiOjAuNjIxNDcwMzk2OTU5MzU0NywiYWR2ZXJ0U2xvdCI6MSwib3JkZXIiOjIsInNlYXJjaFRlcm0iOiJzYWF0IiwiYXR0cmlidXRlcyI6IlN1Z2dlc3Rpb25fQSxSZWxldmFuY3lfMSxGaWx0ZXJSZWxldmFuY3lfMSxMaXN0aW5nU2NvcmluZ0FsZ29yaXRobUlkXzEsU21hcnRsaXN0aW5nXzIsU3VnZ2VzdGlvbkJhZGdlc19BLFByb2R1Y3RHcm91cFRvcFBlcmZvcm1lcl9CLE9wZW5GaWx0ZXJUb2dnbGVfMixTdWdnZXN0aW9uU3RvcmVBZHNfQSxCYWRnZUJvb3N0X0EifQ==",
  "https://www.trendyol.com/skechers/kadin-pembe-sandalet-p-363997697?boutiqueId=61&merchantId=2617&filterOverPriceListings=false&sav=true",
  "https://www.trendyol.com/besir-giyim/kadin-siyah-kemerli-deri-mont-ceket-p-93613624",
  "https://www.trendyol.com/besir-giyim/kadin-siyah-kemerli-deri-mont-ceket-p-93613624"
];
List<int> productPriceList = [100, 200, 300, 600];
List<String> productDateList = ["Bugün", "Dün ", " 19 mayıs", "20 haziran"];
List<String> productImportList = ["⭐", "⭐", "⭐", "⭐"];
List<String> productCategory = ["Mont", "Ayakkabı ", " Takı"];

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<bool> tick = List.generate(productNameList.length, (index) => false);

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
          child: LinkAddFloating(
            formKey: _formKey,
            dropdownItems: productCategory,
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
                  )
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
            SizedBox(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: productNameList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: CustomToDoBox(
                              price: productPriceList[index],
                              link: productLinks[index],
                              tick: tick[index],
                              name: productNameList[index],
                              date: productDateList[index],
                              import: productImportList[index].toString(),
                            )),
                        const VerticalSpace(height: 10),
                      ],
                    );

                    // return ExpansionTile(
                    //   leading: _oncelikIconuAta(
                    //       tumNotlar![index].notOncelik!.toInt()),
                    //   title: Text(tumNotlar![index].notBaslik.toString()),
                    //   children: <Widget>[
                    //     Container(
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Padding(
                    //                 padding: const EdgeInsets.all(8.0),
                    //                 child: Text(
                    //                   "Kategori",
                    //                   style: TextStyle(color: Colors.redAccent),
                    //                 ),
                    //               ),
                    //               Padding(
                    //                 padding: const EdgeInsets.all(8.0),
                    //                 child: Text(
                    //                   tumNotlar![index]
                    //                       .kategoriBaslik
                    //                       .toString(),
                    //                   style: TextStyle(color: Colors.black),
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //           Row(
                    //             children: [
                    //               Padding(
                    //                 padding: const EdgeInsets.all(8.0),
                    //                 child: Text(
                    //                   "Oluşturulma Tarihi",
                    //                   style: TextStyle(color: Colors.redAccent),
                    //                 ),
                    //               ),
                    //               Padding(
                    //                 padding: const EdgeInsets.all(8.0),
                    //                 child: Text(
                    //                   databaseHelper!.dateFormat(DateTime.parse(
                    //                       //! parse işlemi yaparak sen bana string bir tarşh ver ben seni tarihe dönüştürürüm diyor
                    //                       tumNotlar![index]
                    //                           .notTarih
                    //                           .toString())),
                    //                   style: TextStyle(color: Colors.black),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           Row(
                    //             children: [
                    //               Padding(
                    //                 padding: const EdgeInsets.all(8.0),
                    //                 child: Text(
                    //                   tumNotlar![index].notIcerik.toString(),
                    //                   style: TextStyle(fontSize: 18),
                    //                 ),
                    //               ),
                    //               ButtonBar(
                    //                 alignment: MainAxisAlignment.center,
                    //                 mainAxisSize: MainAxisSize.min,
                    //                 children: <Widget>[
                    //                   TextButton(
                    //                       onPressed: () =>
                    //                           _notSil(tumNotlar![index].notID),
                    //                       child: Text(
                    //                         "SİL",
                    //                         style: TextStyle(
                    //                             color: Colors.redAccent),
                    //                       )),
                    //                   TextButton(
                    //                       onPressed: () {
                    //                         _detaySayfasinaGit(
                    //                             context, tumNotlar![index]);
                    //                       },
                    //                       child: Text(
                    //                         "GÜNCELLE",
                    //                         style:
                    //                             TextStyle(color: Colors.green),
                    //                       ))
                    //                 ],
                    //               )
                    //             ],
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  int totalPrice() {
    var result = 0;
    for (var i = 0; i < productPriceList.length; i++) {
      result = productPriceList[i] + result;
    }
    return result;
  }
}
