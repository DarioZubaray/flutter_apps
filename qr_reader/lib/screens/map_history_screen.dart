import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_type.dart';
import 'package:qr_reader/widgets/scan_tiles.dart';

class MapHistoryScreen extends StatelessWidget {
  const MapHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: ScanType.geo, icon: Icons.maps_home_work);
  }
}