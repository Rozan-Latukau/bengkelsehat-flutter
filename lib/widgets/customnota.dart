// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/home.dart';
// ignore: unused_import
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
class customnota extends StatelessWidget {
  final String tanggal;
  final String namasukucadang;
  final String nama;
  final String nomortransaksi;

  final String metodetransaksi;

  final String harga;

  const customnota({
    super.key,
    required this.tanggal,
    required this.namasukucadang,
    required this.nama,
    required this.nomortransaksi,
    required this.metodetransaksi,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 342,
      padding: const EdgeInsets.only(
        left: 13,
        right: 13,
        top: 27,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffF0F0F0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/Logo.png',
              width: 110,
              height: 36,
            ),
          ),
          Center(
            child: Text(
              'Transaksi Berhasil',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Tanggal',
                style: body5reguler,
              ),
              const Spacer(),
              Text(
                tanggal,
                style: body5reguler,
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text(
                'Nama Pelanggan',
                style: body5reguler,
              ),
              const Spacer(),
              Text(
                nama,
                style: body5reguler,
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text(
                'Nomor Transaksi',
                style: body5reguler,
              ),
              const Spacer(),
              Text(
                nomortransaksi,
                style: body5reguler,
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text(
                'Metode Transaksi',
                style: body5reguler,
              ),
              const Spacer(),
              Text(
                metodetransaksi,
                style: body5reguler,
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text(
                'Nama Suku Cadang',
                style: body5reguler,
              ),
              const Spacer(),
              Text(
                namasukucadang,
                style: body5reguler,
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text(
                'Total Pembayaran',
                style: body5reguler,
              ),
              const Spacer(),
              Text(
                harga,
                style: body5reguler,
              )
            ],
          ),
        ],
      ),
    );
  }
}
