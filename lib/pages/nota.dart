import 'package:aplikasi_bengkelsehat/pages/homebaru.dart';
import 'package:aplikasi_bengkelsehat/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/transaksi.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/home.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/widgets/customlist.dart';

// ignore: camel_case_types
class nota extends StatefulWidget {
  final String id;
  final String opsi;
  final String namasukucadang;

  final String harga;

  const nota(this.id, this.opsi, this.namasukucadang, this.harga, {Key? key})
      : super(key: key);

  @override
  State<nota> createState() =>
      // ignore: no_logic_in_create_state
      _nota(id, opsi, namasukucadang, harga);
}

// ignore: camel_case_types
class _nota extends State<nota> {
  final String _id;
  final String _opsi;
  final String _namasukucadang;

  final String _harga;

  _nota(this._id, this._opsi, this._namasukucadang, this._harga);

  double additionalFee = 0.0;
  @override
  void initState() {
    super.initState();
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
    } // Set the additional fee for other products
  }

  @override
  Widget build(BuildContext context) {
    double totalPayment = double.parse(_harga) + additionalFee;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 30,
            right: 30,
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 370,
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
                          'ID Plat Nomor',
                          style: body5reguler,
                        ),
                        const Spacer(),
                        Text(
                          'AD5579DAC',
                          style: body5reguler,
                        )
                      ],
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
                          '21 Juni 2023',
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
                          'Fauzan Rafi',
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
                          '0260 **** **** 253',
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
                          'Transfer Bank BRI',
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
                          _namasukucadang,
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
                        if (_opsi == "Service")
                          Text(
                            "Rp. ${totalPayment.toStringAsFixed(3)}", // Calculate the total payment for service option
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
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'kami tunggu service berikutnya pada bulan Agustus 2023',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Terima kasih telah mempercayai bengkel kami ',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                color: const Color(0xff3C486B),
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    child: Text(
                      'Ok',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => homeprofil(),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
