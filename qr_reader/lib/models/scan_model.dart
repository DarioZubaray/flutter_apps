import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));
String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
    ScanModel({
        this.id,
        required this.valor,
    }) {
      if (valor.contains('http')) {
        tipo = 'http';
      } else {
        tipo = 'geo';
      }
    }

    int? id;
    String? tipo;
    String valor;

    LatLng getLatLng() {
      final coords = valor.replaceFirst('geo:', '');
      final lat = double.parse(coords.split(',')[0]);
      final lng = double.parse(coords.split(',')[1]);

      return LatLng(lat, lng);
    }

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
