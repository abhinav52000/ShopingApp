import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class SalesData extends HiveObject {
  SalesData(
      {required this.quantity,
      required this.productname,
      required this.unitprice,
      this.colorvariant = '',
      this.sizevariant = ''});

  @HiveField(0)
  int quantity;

  @HiveField(1)
  String productname;

  @HiveField(2)
  String unitprice;

  @HiveField(3)
  String colorvariant;

  @HiveField(4)
  String sizevariant;
}

@HiveType(typeId: 1)
class SelectedProduct extends HiveObject {
  SelectedProduct({
    required this.quantity,
    required this.productname,
    required this.unitprice,
    required this.colorvariant,
    required this.sizevariant,
  });

  @HiveField(0)
  int quantity;

  @HiveField(1)
  String productname;

  @HiveField(2)
  String unitprice;

  @HiveField(3)
  String colorvariant;

  @HiveField(4)
  String sizevariant;
}
