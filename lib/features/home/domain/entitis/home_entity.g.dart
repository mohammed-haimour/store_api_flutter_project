// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeEntityAdapter extends TypeAdapter<HomeEntity> {
  @override
  final int typeId = 1;

  @override
  HomeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeEntity(
      title: fields[0] as String,
      imageUrl: fields[1] as String,
      productPrice: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HomeEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.productPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
