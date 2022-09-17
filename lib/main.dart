import 'package:flutter/material.dart';
import 'package:qr_scanner_plus/qr_scanner_plus.dart';
import 'package:scannerapp/widgets/tiles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _scanType = 'Unknown';
  String _scanRawValue = 'Unknown';

  _onResult(List<Barcode> barcodes) {
    for (final barcode in barcodes) {
      var barcodeResultOne = barcode.type;
      var barcodeResultTwo = barcode.rawValue;
      setState(() {
        _scanType = barcodeResultOne.toString();
        _scanRawValue = barcodeResultTwo.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanner'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ScanResultTile(
                        description: 'Type of the scan',
                        scanResult: _scanType,
                        icon: Icons.abc_sharp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ScanResultTile(
                        description: 'This is the barcode text',
                        icon: Icons.add_comment,
                        scanResult: _scanRawValue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Card(
                    child: SizedBox(
                      child: QrScannerPlusView(
                        _onResult,
                        multiCodeSelect: true,
                        debug: true,
                      ),
                    ),
                  );
                },
              );
            },
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }
}
