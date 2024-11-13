import 'package:flutter/material.dart';

class ScanResultCard extends StatelessWidget {
  final String description;
  final IconData icon;
  final String scanResult;

  const ScanResultCard({
    Key? key,
    required this.description,
    required this.icon,
    required this.scanResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        tileColor: Colors.blue[50],
        leading: Icon(
          icon,
          color: Colors.blueAccent,
        ),
        title: Text(
          description,
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          scanResult,
          style: TextStyle(
            color: Colors.blue[700],
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
