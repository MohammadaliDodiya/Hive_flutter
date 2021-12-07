// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrasacationsAdapter extends TypeAdapter<Trasacations> {
  @override
  final int typeId = 0;

  @override
  Trasacations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Trasacations(
      title: fields[1] as String,
      desc: fields[2] as String,
      money: fields[3] as int,
      isExpanse: fields[4] as bool,
      date: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Trasacations obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.money)
      ..writeByte(4)
      ..write(obj.isExpanse)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrasacationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
