import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchGeoAndUrl(BuildContext context, ScanModel scanModel) async {

  final url = Uri.parse(scanModel.valor);

  if (scanModel.tipo == 'http') {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scanModel);
  }
}
