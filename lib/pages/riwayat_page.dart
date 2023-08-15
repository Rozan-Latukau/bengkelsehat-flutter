import 'package:flutter/material.dart';

// ignore: camel_case_types
class riwayat extends StatelessWidget {
  const riwayat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Header Awal
    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Row(
          children: [
            Image.asset(
              'assets/Logo.png',
              width: 82,
              height: 27,
            ),
            const Spacer(),
            Image.asset(
              'assets/profile.png',
              width: 35,
              height: 35,
            ),
          ],
        ),
      );
    }
    // Header AKhir

    return Scaffold(
        body: Column(
      children: [
        header(),
      ],
    ));
  }
}
