// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_pollution_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AirPollutionResponseEntityAdapter
    extends TypeAdapter<AirPollutionResponseEntity> {
  @override
  final int typeId = 3;

  @override
  AirPollutionResponseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AirPollutionResponseEntity(
      list: (fields[0] as List).cast<AirPollutionEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, AirPollutionResponseEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AirPollutionResponseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AirPollutionEntityAdapter extends TypeAdapter<AirPollutionEntity> {
  @override
  final int typeId = 4;

  @override
  AirPollutionEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AirPollutionEntity(
      aqi: fields[0] as int,
      no2: fields[1] as double,
      o3: fields[2] as double,
      so2: fields[3] as double,
      pm2_5: fields[4] as double,
      dt: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AirPollutionEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.aqi)
      ..writeByte(1)
      ..write(obj.no2)
      ..writeByte(2)
      ..write(obj.o3)
      ..writeByte(3)
      ..write(obj.so2)
      ..writeByte(4)
      ..write(obj.pm2_5)
      ..writeByte(5)
      ..write(obj.dt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AirPollutionEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
