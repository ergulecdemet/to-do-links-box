import 'dart:io';

import 'package:flutter/services.dart';
import 'package:my_links/model/category.dart';
import 'package:my_links/model/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper!;
    } else {
      return _databaseHelper!;
    }
  }
  DatabaseHelper._internal();

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database!;
    } else {
      return _database!;
    }
  }

  Future<Database> _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "links.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      print("Creating new copy from asset");

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "links.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
    return await openDatabase(path, readOnly: false);
  }
//---category

  Future<List<Map<String, dynamic>>> getCategory() async {
    var db = await _getDatabase();
    var sonuc = await db.query("category");
    print("GET Category $sonuc");
    // var addCategory =
    //     await db.insert("category", {'categoryName': 'Kışlııııkk'});
    // sonuc = await db.query("category");
    return sonuc;
  }

  Future<List<MyCategory>> getCategoriesList() async {
    var categoryMapList = await getCategory();
    List<MyCategory> categoryList = [];
    for (Map map in categoryMapList) {
      categoryList.add(MyCategory.fromMap(map as Map<String, dynamic>));
    }
    return categoryList;
  }

  Future<int> addCategory(MyCategory category) async {
    var db = await _getDatabase();
    var result = await db.insert("category", category.toMap());
    return result;
  }
//---products table functions

  Future<List<Map<String, dynamic>>> getProducts() async {
    var db = await _getDatabase();
    var sonuc = await db.query("product");
    print("products get $sonuc");
    // var addCategory = await db.insert("product", {
    //   'productName': 'Koton Pantolon',
    //   'categoryId': 3,
    //   'productPrice': 100
    // });
    // sonuc = await db.query("product");
    print(sonuc);
    return sonuc;
  }

  Future<List<Product>> getProductList() async {
    var productMapList = await getProducts();
    List<Product> productList = [];
    for (Map map in productMapList) {
      productList.add(Product.fromMap(map as Map<String, dynamic>));
    }
    return productList;
  }

  Future addProduct(Product product) async {
    var db = await _getDatabase();
    var sonuc = await db.insert("product", product.toMap());
    return sonuc;
  }

  // Future productUpdate(Product product) async {
  //   var db = await _getDatabase();
  //   var sonuc = await db.update("product", product.toMap(),
  //       where: 'productId=?', whereArgs: [product.productId]);
  //   return sonuc;
  // }

  // Future<int> productDelete(int productId) async {
  //   var db = await _getDatabase();
  //   var sonuc = await db
  //       .delete("product", where: 'productId=?', whereArgs: [productId]);
  //   return sonuc;
  // }

  //---date etc.

  String dateFormat(DateTime tm) {
    DateTime today = DateTime.now();
    Duration oneDay = const Duration(days: 1);
    Duration twoDay = const Duration(days: 2);
    Duration oneWeek = const Duration(days: 7);
    String? month;
    switch (tm.month) {
      case 1:
        month = "Ocak";
        break;
      case 2:
        month = "Şubat";
        break;
      case 3:
        month = "Mart";
        break;
      case 4:
        month = "Nisan";
        break;
      case 5:
        month = "Mayıs";
        break;
      case 6:
        month = "Haziran";
        break;
      case 7:
        month = "Temmuz";
        break;
      case 8:
        month = "Ağustos";
        break;
      case 9:
        month = "Eylül";
        break;
      case 10:
        month = "Ekim";
        break;
      case 11:
        month = "Kasım";
        break;
      case 12:
        month = "Aralık";
        break;
    }

    Duration difference = today.difference(tm);

    if (difference.compareTo(oneDay) < 1) {
      return "Bugün";
    } else if (difference.compareTo(twoDay) < 1) {
      return "Dün";
    } else if (difference.compareTo(oneWeek) < 1) {
      switch (tm.weekday) {
        case 1:
          return "Pazartesi";
        case 2:
          return "Salı";
        case 3:
          return "Çarşamba";
        case 4:
          return "Perşembe";
        case 5:
          return "Cuma";
        case 6:
          return "Cumartesi";
        case 7:
          return "Pazar";
      }
    } else if (tm.year == today.year) {
      return '${tm.day} $month';
    } else {
      return '${tm.day} $month ${tm.year}';
    }
    return "";
  }
}
