// ignore: unused_import
import 'package:aplikasi_bengkelsehat/theme.dart';
import 'package:aplikasi_bengkelsehat/widgets/customnotif.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/widgets/customkeluhan.dart';
// ignore: duplicate_import
import 'package:aplikasi_bengkelsehat/widgets/customnotif.dart';

// ignore: camel_case_types
class notif extends StatelessWidget {
  const notif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    // ignore: unused_local_variable
    CollectionReference sukucadang = firestore.collection('sukucadang');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 30,
              right: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                  child: Image.asset(
                    'assets/back.png',
                    width: 25,
                    height: 25,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Customnotif(
                      image: 'assets/Iconnotif.png',
                      textawal:
                          'jangan lupa 2 minggu lagi anda harus a ( Ganti Oli ) kembali ',
                      textakhir:
                          'Jagalah kesehatan motor anda agar anda nyaman berkendara ',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
