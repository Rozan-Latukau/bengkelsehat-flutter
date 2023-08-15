import 'package:aplikasi_bengkelsehat/theme.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/produk_page.dart';
import 'package:aplikasi_bengkelsehat/models/size.dart';

// ignore: camel_case_types
class sizecard extends StatelessWidget {
  // const sizecard({Key? key}) : super(key: key);
  final Size size;
  const sizecard(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: size.isActive
          ? Container(
              padding: const EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 7,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffF9D949),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
              ),
              child: Text(
                size.selected,
                style: poppinsTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 9,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
              ),
              child: Text(
                size.selected,
                style: poppinsTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
    );
  }
}
