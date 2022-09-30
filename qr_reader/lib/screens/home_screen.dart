import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

import 'package:qr_reader/screens/screens.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: (() {
              final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
            _showMyDialog(context, scanListProvider);
          }),
          icon: const Icon(Icons.delete_forever))
        ],
        title: const Text('Historial'),
      ),

      body: const _HomeScreenBody(),

      bottomNavigationBar: const CustomNavigationBar(),

      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }


  Future<void> _showMyDialog(context, ScanListProvider scanListProvider) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: const[
              Icon(Icons.warning_amber),
              SizedBox(width: 5,),
              Text('Warning!'),
            ],
          ),

          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure you want to delete all scans?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(height: 10),
                Text('this action can not be undone!'),
              ],
            ),
          ),

          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () {

                scanListProvider.borrarTodos();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch(currentIndex) {
      case 0:
        scanListProvider.cargarScansByTipo('geo');
        return const MapHistoryScreen();
      case 1:
        scanListProvider.cargarScansByTipo('http');
        return const AddressesScreen();

      default:
      return const MapScreen();
    }
  }

}
