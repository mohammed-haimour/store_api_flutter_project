// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SignInEntityAdapter extends TypeAdapter<SignInEntity> {
  @override
  final int typeId = 0;

  @override
  SignInEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SignInEntity(
      token: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SignInEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignInEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
