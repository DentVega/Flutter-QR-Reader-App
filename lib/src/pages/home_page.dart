import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/bloc/scans_bloc.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:qrreaderapp/src/pages/direcciones_page.dart';
import 'package:qrreaderapp/src/pages/mapas_page.dart';
import 'package:barcode_scan/barcode_scan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scansBloc = new ScansBloc();
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {
            scansBloc.borrarScanTodos();
          },)
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavitaion(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: _scanQR,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _crearBottomNavitaion() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Mapa')),
        BottomNavigationBarItem(icon: Icon(Icons.brightness_5), title: Text('Direcciones')),
      ],
    );
  }

  Widget _callPage(int paginaActual) {
    switch(paginaActual) {
      case 0: return MapasPage();
      case 1: return DireccionesPage();

      default:
        return MapasPage();
    }
  }

  void _scanQR() async {
    // https://pub.dev/packages/barcode_scan#-installing-tab-
    // geo:40.72215149405802,-74.09795179804689
//    String futureString = '';
    String futureString = 'https://pub.dev/packages/barcode_scan#-installing-tab-';



//    try {
//      futureString = await BarcodeScanner.scan();
//    } catch(e) {
//      futureString = e.toString();
//    }
//    print('Future String : ${futureString}');

    if (futureString != null) {
      final scan = ScanModel(valor: futureString);
      scansBloc.agregarScan(scan);
    }
  }
}
