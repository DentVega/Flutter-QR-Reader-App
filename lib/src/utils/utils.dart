import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

abrirScan(ScanModel scan, BuildContext context) async {
  const url = 'https://flutter.dev';

  if (scan.tipo == 'http') {
    if (await canLaunch(scan.valor)) {
      await launch(scan.valor);
    } else {
      throw 'Could not launch $scan.valor';
    }
  } else {
    print('geo');
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}