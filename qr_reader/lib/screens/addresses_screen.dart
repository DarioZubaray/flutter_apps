import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_type.dart';
import 'package:qr_reader/widgets/scan_tiles.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: ScanType.http, icon: Icons.home_outlined);
  }
}