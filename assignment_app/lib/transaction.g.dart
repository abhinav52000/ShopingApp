// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalesDataAdapter extends TypeAdapter<SalesData> {
  @override
  final int typeId = 0;

  @override
  SalesData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SalesData(
      quantity: fields[0] as int,
      productname: fields[1] as String,
      unitprice: fields[2] as String,
      colorvariant: fields[3] as String,
      sizevariant: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SalesData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.quantity)
      ..writeByte(1)
      ..write(obj.productname)
      ..writeByte(2)
      ..write(obj.unitprice)
      ..writeByte(3)
      ..write(obj.colorvariant)
      ..writeByte(4)
      ..write(obj.sizevariant);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalesDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SelectedProductAdapter extends TypeAdapter<SelectedProduct> {
  @override
  final int typeId = 1;

  @override
  SelectedProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SelectedProduct(
      quantity: fields[0] as int,
      productname: fields[1] as String,
      unitprice: fields[2] as String,
      colorvariant: fields[3] as String,
      sizevariant: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SelectedProduct obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.quantity)
      ..writeByte(1)
      ..write(obj.productname)
      ..writeByte(2)
      ..write(obj.unitprice)
      ..writeByte(3)
      ..write(obj.colorvariant)
      ..writeByte(4)
      ..write(obj.sizevariant);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
