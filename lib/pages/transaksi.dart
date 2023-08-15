// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/nota.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/theme.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/widgets/customlist.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/widgets/sukucadang.dart';
// ignore: duplicate_import, unused_import
import 'package:aplikasi_bengkelsehat/widgets/customlist.dart';
// ignore: unused_import, duplicate_import
import 'package:aplikasi_bengkelsehat/theme.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/models/size.dart';

// ignore: camel_case_types
class transaksi extends StatefulWidget {
  final String id;
  final String namasukucadang;
  final String image;
  final String detailproduk;

  final String stoksukucadang;
  final String promo;
  final String harga;
  final String hrg;
  final String opsi;

  const transaksi(this.id, this.namasukucadang, this.image, this.detailproduk,
      this.stoksukucadang, this.promo, this.harga, this.hrg, this.opsi,
      {Key? key})
      : super(key: key);

  @override
  State<transaksi> createState() =>
      // ignore: no_logic_in_create_state
      _transaksi(id, namasukucadang, image, detailproduk, stoksukucadang, promo,
          harga, hrg, opsi);
}

// ignore: camel_case_types
class _transaksi extends State<transaksi> {
  final String _id;
  final String _namasukucadang;
  final String _image;
  // ignore: unused_field
  final String _detailproduk;

  // ignore: unused_field
  final String _stoksukucadang;
  // ignore: unused_field
  final String _promo;
  final String _harga;
  final String _hrg;
  final String _opsi;

  _transaksi(this._id, this._namasukucadang, this._image, this._detailproduk,
      this._stoksukucadang, this._promo, this._harga, this._hrg, this._opsi);

  String opsi = '';
  double additionalFee = 0.0;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double totalPayment = double.parse(_harga) + additionalFee;
    if (_id == "1") {
      additionalFee = 5.0; // Set the additional fee for Product A
    } else if (_id == "2") {
      additionalFee = 10.0; // Set the additional fee for Product B
    } else if (_id == "3") {
      additionalFee = 8.0; // Set the additional fee for Product C
    } else if (_id == "4") {
      additionalFee = 3.0; // Set the additional fee for Product C
    } else if (_id == "5") {
      additionalFee = 15.0; // Set the additional fee for Product C
    } else if (_id == "6") {
      additionalFee = 6.0; // Set the additional fee for Product C
    } else if (_id == "7") {
      additionalFee = 9.0; // Set the additional fee for Product C
    } else if (_id == "8") {
      additionalFee = 20.0;
    } // Set th
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 30,
            right: 30,
          ),
          child: SingleChildScrollView(
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
                const SizedBox(height: 30),
                Row(
                  children: [
                    Container(
                      width: 350,
                      height: 118,
                      color: const Color(0xffF0F0F0),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                _image,
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
                                    _namasukucadang,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    _opsi,
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
                                            'Rp. ${_harga}',
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            // ignore: unnecessary_brace_in_string_interps
                                            'Rp. ${_hrg}',
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xffF45050),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800,
                                              decoration:
                                                  TextDecoration.lineThrough,
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
                  ],
                ),
                const SizedBox(height: 35),
                Container(
                  width: 350,
                  height: 65,
                  color: const Color(0xffF0F0F0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 5,
                      bottom: 5,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/metode.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 11),
                        Text(
                          'Metode Pembayaran',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/right.png',
                          width: 25,
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 350,
                  height: 65,
                  color: const Color(0xffF0F0F0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 5,
                      bottom: 5,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/promo.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 11),
                        Text(
                          'Makin Hemat Pakai Promo',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/right.png',
                          width: 25,
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 350,
                  height: 200,
                  color: const Color(0xffF0F0F0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 12,
                      bottom: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rincian Pembayaran',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          _opsi,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              _namasukucadang,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              // ignore: unnecessary_brace_in_string_interps
                              'Rp. ${_harga}',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            if (_opsi == "Service")
                              Text(
                                "Harga Service",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            const Spacer(),
                            if (_opsi == "Service")
                              Text(
                                "Rp. ${additionalFee.toStringAsFixed(3)}", // Display the additional fee
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                          ],
                        ),
                        const Divider(
                          color: Colors.black, // Warna garis
                          thickness: 1, // Ketebalan garis
                          height: 20, // Tinggi garis
                        ),
                        Row(
                          children: [
                            Text(
                              "Total Pembayaran",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
                            if (_opsi == "Service")
                              Text(
                                "Rp. ${(double.parse(_harga) + additionalFee).toStringAsFixed(3)}", // Calculate the total payment for service option
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            if (_opsi != "Service")
                              Text(
                                "Rp. ${double.parse(_harga).toStringAsFixed(3)}", // Display the regular total payment for other options
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    color: const Color(0xff3C486B),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: TextButton(
                      child: Text(
                        'Bayar',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => nota(
                              _id,
                              opsi,
                              _namasukucadang,
                              _harga,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
