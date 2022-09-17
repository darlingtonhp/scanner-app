import 'package:flutter/material.dart';

class ScanResultTile extends StatelessWidget {
  final String description;
  final IconData icon;
  final String scanResult;

  const ScanResultTile({
    Key? key,
    required this.description,
    required this.icon,
    required this.scanResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.blue,
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        description,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(scanResult),
    );
  }
}
