// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/home.dart';
import 'package:aplikasi_bengkelsehat/pages/produk_page.dart';
import 'package:flutter/material.dart';
// ignore: unused_import, duplicate_import
import 'package:aplikasi_bengkelsehat/pages/home.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/theme.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/transaksi.dart';

// ignore: camel_case_types
class customkeluhan extends StatelessWidget {
  final String id;
  final String namasukucadang;
  final String image;
  final String detailproduk;
  final String stoksukucadang;
  final String promo;
  final String harga;
  final String hrg;
  final String opsi;

  const customkeluhan({
    super.key,
    required this.id,
    required this.namasukucadang,
    required this.image,
    required this.detailproduk,
    required this.stoksukucadang,
    required this.promo,
    required this.harga,
    required this.hrg,
    required this.opsi,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => produk(
                  id,
                  namasukucadang,
                  image,
                  detailproduk,
                  stoksukucadang,
                  promo,
                  harga,
                  hrg,
                  opsi,
                ),
              ),
            );
          },
          child: Container(
            width: 350,
            height: 99,
            color: const Color(0xffF0F0F0),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 5,
                bottom: 5,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      image,
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          namasukucadang,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          promo,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Column(
                              children: [
                                Text(
                                  // ignore: unnecessary_brace_in_string_interps
                                  'Rp. ${harga}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  // ignore: unnecessary_brace_in_string_interps
                                  'Rp. ${hrg}',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xffF45050),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 2.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
