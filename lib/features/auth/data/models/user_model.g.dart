// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      usersId: fields[0] as int?,
      usersName: fields[1] as String?,
      usersPassword: fields[2] as String?,
      usersEmail: fields[3] as String?,
      usersPhone: fields[4] as String?,
      usersVerifycode: fields[5] as int?,
      usersApprove: fields[6] as int?,
      usersCreate: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.usersId)
      ..writeByte(1)
      ..write(obj.usersName)
      ..writeByte(2)
      ..write(obj.usersPassword)
      ..writeByte(3)
      ..write(obj.usersEmail)
      ..writeByte(4)
      ..write(obj.usersPhone)
      ..writeByte(5)
      ..write(obj.usersVerifycode)
      ..writeByte(6)
      ..write(obj.usersApprove)
      ..writeByte(7)
      ..write(obj.usersCreate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
