import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/scan_model.dart';

class DBProvider {

  static const String _table = 'Scans';
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    print('Inicializando la base de datos');
    if (_database != null) return _database!;
  
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    // Path de donde almacenaremos la base de datos
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentDirectory.path, 'ScansDB.db');

    // Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onCreate: ((db, version) async {
        await db.execute('''
          CREATE TABLE $_table(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
      })
    );
  }

  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    // destructuracion
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    // verficar la base de datos
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO $_table (id, tipo, valor)
        VALUES ( $id, $tipo, $valor)
    ''');

    return res;
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert(_table, nuevoScan.toJson());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;

    final res = await db.query(_table, where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty
      ? ScanModel.fromJson(res.first)
      : null;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;

    final res = await db.query(_table);

    return res.isNotEmpty
      ? res.map((e) => ScanModel.fromJson(e)).toList()
      : [];
  }

  Future<List<ScanModel>> getScanByType(String tipo) async {
    final db = await database;

    final res = await db.rawQuery('''
      SELECT * FROM $_table WHERE tipo = '$tipo'
    ''');

    return res.isNotEmpty
      ? res.map((e) => ScanModel.fromJson(e)).toList()
      : [];
  }

  Future<int> updateScan(ScanModel scanActualizar) async {
    final db = await database;

    final res = await db.update(_table,
      scanActualizar.toJson(),
      where: 'id = ?',
      whereArgs: [scanActualizar.id]
    );
    return res;
  }

  Future<int> deleteScan( int id ) async {
    final db = await database;

    final res = await db.delete(_table, where: 'id = ?', whereArgs: [ id ]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;

    // final res = await db.delete(_table);
    final res = await db.rawDelete('''
      DELETE FROM $_table
    ''');
    return res;
  }
}
