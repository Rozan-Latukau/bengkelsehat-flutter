// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/home.dart';

import 'package:flutter/material.dart';
// ignore: unused_import, duplicate_import
import 'package:aplikasi_bengkelsehat/pages/home.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/shop_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Customnotif extends StatelessWidget {
  final String image;
  final String textawal;
  final String textakhir;
  // ignore: use_key_in_widget_constructors
  const Customnotif(
      {required this.image, required this.textawal, required this.textakhir});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 333,
            height: 290,
            color: const Color(0xfff0f0f0),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 20,
                right: 20,
                bottom: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    textawal,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    textakhir,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
