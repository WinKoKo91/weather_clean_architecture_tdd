// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherEntityAdapter extends TypeAdapter<WeatherEntity> {
  @override
  final int typeId = 0;

  @override
  WeatherEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherEntity(
      cityName: fields[0] as String,
      country: fields[1] as String,
      main: fields[2] as String,
      description: fields[3] as String,
      iconCode: fields[4] as String,
      pressure: fields[5] as int,
      humidity: fields[6] as int,
      dt: fields[7] as int,
      lat: fields[12] as double,
      lon: fields[13] as double,
      sunrise: fields[8] as int,
      sunset: fields[9] as int,
      visibility: fields[10] as int,
      feelsLike: fields[14] as double,
      temperature: fields[11] as double,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherEntity obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.cityName)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.main)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.iconCode)
      ..writeByte(5)
      ..write(obj.pressure)
      ..writeByte(6)
      ..write(obj.humidity)
      ..writeByte(7)
      ..write(obj.dt)
      ..writeByte(8)
      ..write(obj.sunrise)
      ..writeByte(9)
      ..write(obj.sunset)
      ..writeByte(10)
      ..write(obj.visibility)
      ..writeByte(11)
      ..write(obj.temperature)
      ..writeByte(12)
      ..write(obj.lat)
      ..writeByte(13)
      ..write(obj.lon)
      ..writeByte(14)
      ..write(obj.feelsLike);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
