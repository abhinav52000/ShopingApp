import 'package:assignment_app/Screen/screen1.dart';
import 'package:assignment_app/transaction.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

dynamic box, selecteditembox;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(SalesDataAdapter());
  Hive.registerAdapter(SelectedProductAdapter());
  box = await Hive.openBox<SalesData>('box');
  selecteditembox = await Hive.openBox<SelectedProduct>('selecteditembox');
  // box.put(
  //   0,
  //   SalesData(quantity: 20, productname: 'acc cement'),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SalesData salesData = box.get(0);
    // print('${salesData.quantity} and ${salesData.productname}');
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screeen1(),
    );
  }
}
