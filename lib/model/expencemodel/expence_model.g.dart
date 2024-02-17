// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expence_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class expenceAdapter extends TypeAdapter<expence> {
  @override
  final int typeId = 2;

  @override
  expence read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return expence(
      incometype: fields[0] as String,
      descr: fields[1] as String,
      amount: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, expence obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.incometype)
      ..writeByte(1)
      ..write(obj.descr)
      ..writeByte(2)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is expenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
