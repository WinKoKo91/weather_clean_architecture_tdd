// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForecastResponseEntityAdapter
    extends TypeAdapter<ForecastResponseEntity> {
  @override
  final int typeId = 1;

  @override
  ForecastResponseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForecastResponseEntity(
      code: fields[0] as String,
      list: (fields[1] as List).cast<ForecastEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, ForecastResponseEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastResponseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ForecastEntityAdapter extends TypeAdapter<ForecastEntity> {
  @override
  final int typeId = 2;

  @override
  ForecastEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForecastEntity(
      iconCode: fields[0] as String,
      dt: fields[1] as int,
      windDegree: fields[2] as int,
      windSpeed: fields[4] as double,
      temperature: fields[3] as double,
      hour: fields[7] as String?,
      day: fields[6] as String?,
      date: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ForecastEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.iconCode)
      ..writeByte(1)
      ..write(obj.dt)
      ..writeByte(2)
      ..write(obj.windDegree)
      ..writeByte(3)
      ..write(obj.temperature)
      ..writeByte(4)
      ..write(obj.windSpeed)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.day)
      ..writeByte(7)
      ..write(obj.hour);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
