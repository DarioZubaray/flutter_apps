import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/models/scan_type.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {

  List<ScanModel> scans = [];
  ScanType tipoSeleccionada = ScanType.http;

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);

    nuevoScan.id = id;

    if (tipoSeleccionada.toString().split('.')[1] == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScansByTipo(String tipo) async {
    final scans = await DBProvider.db.getScanByType(tipo);
    this.scans = [...scans];
    tipoSeleccionada = (tipo == 'http') ? ScanType.http : ScanType.geo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  borrarScansById(int id) async {
    await DBProvider.db.deleteScan(id);
    // cargarScansByTipo(tipoSeleccionada.toString().split('.')[1]);
  }
}
