import 'package:flutter/material.dart';

class ConnectionDisablePage extends StatelessWidget {
  const ConnectionDisablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Internet is not available, please check wifi/data! 🙏',
      style: TextStyle(
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
    );
  }
}
