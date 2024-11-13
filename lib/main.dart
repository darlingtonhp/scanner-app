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
      title: 'QR & Barcode Scanner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
      setState(() {
        _scanType = barcode.type.toString();
        _scanRawValue = barcode.rawValue ?? 'No Data';
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
        title: const Text('QR & Barcode Scanner'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display Scan Results in Cards
            Expanded(
              child: ListView(
                children: [
                  ScanResultCard(
                    description: 'Scan Type:',
                    icon: Icons.code,
                    scanResult: _scanType,
                  ),
                  ScanResultCard(
                    description: 'Raw Data:',
                    icon: Icons.text_fields,
                    scanResult: _scanRawValue,
                  ),
                ],
              ),
            ),

            // Start Button to trigger scanning
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 400,
                        child: QrScannerPlusView(
                          _onResult,
                          multiCodeSelect: true,
                          debug: false,
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('Start Scanning'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
