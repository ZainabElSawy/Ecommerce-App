// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemModelAdapter extends TypeAdapter<ItemModel> {
  @override
  final int typeId = 3;

  @override
  ItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemModel(
      itemsId: fields[0] as int?,
      itemsName: fields[1] as String?,
      itemsNameAr: fields[2] as String?,
      itemsDesc: fields[3] as String?,
      itemsDescAr: fields[4] as String?,
      itemsImage: fields[5] as String?,
      itemsCount: fields[6] as int?,
      itemsActive: fields[7] as int?,
      itemsPrice: fields[8] as int?,
      itemsDiscount: fields[9] as int?,
      itemsDate: fields[10] as String?,
      itemsCat: fields[11] as int?,
      categoriesId: fields[12] as int?,
      categoriesName: fields[13] as String?,
      categoriesNameAr: fields[14] as String?,
      categoriesImage: fields[15] as String?,
      categoriesDatetime: fields[16] as String?,
      favorite: fields[17] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.itemsId)
      ..writeByte(1)
      ..write(obj.itemsName)
      ..writeByte(2)
      ..write(obj.itemsNameAr)
      ..writeByte(3)
      ..write(obj.itemsDesc)
      ..writeByte(4)
      ..write(obj.itemsDescAr)
      ..writeByte(5)
      ..write(obj.itemsImage)
      ..writeByte(6)
      ..write(obj.itemsCount)
      ..writeByte(7)
      ..write(obj.itemsActive)
      ..writeByte(8)
      ..write(obj.itemsPrice)
      ..writeByte(9)
      ..write(obj.itemsDiscount)
      ..writeByte(10)
      ..write(obj.itemsDate)
      ..writeByte(11)
      ..write(obj.itemsCat)
      ..writeByte(12)
      ..write(obj.categoriesId)
      ..writeByte(13)
      ..write(obj.categoriesName)
      ..writeByte(14)
      ..write(obj.categoriesNameAr)
      ..writeByte(15)
      ..write(obj.categoriesImage)
      ..writeByte(16)
      ..write(obj.categoriesDatetime)
      ..writeByte(17)
      ..write(obj.favorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
