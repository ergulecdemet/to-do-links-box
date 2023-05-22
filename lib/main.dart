import 'package:flutter/material.dart';
import 'package:my_links/constants/routing.dart';
import 'package:my_links/utils/database_helper.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      var databaseHelper = DatabaseHelper();
      databaseHelper.getCategory();
      databaseHelper.getProducts();

      return const MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: RouteGenerator.routeGenerator,
      );
    });
  }
}
