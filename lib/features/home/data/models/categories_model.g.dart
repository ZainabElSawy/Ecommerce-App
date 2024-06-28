// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoriesModelAdapter extends TypeAdapter<CategoriesModel> {
  @override
  final int typeId = 1;

  @override
  CategoriesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoriesModel(
      categoriesId: fields[0] as int?,
      categoriesName: fields[1] as String?,
      categoriesNameAr: fields[2] as String?,
      categoriesImage: fields[3] as String?,
      categoriesDatetime: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoriesModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.categoriesId)
      ..writeByte(1)
      ..write(obj.categoriesName)
      ..writeByte(2)
      ..write(obj.categoriesNameAr)
      ..writeByte(3)
      ..write(obj.categoriesImage)
      ..writeByte(4)
      ..write(obj.categoriesDatetime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoriesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
