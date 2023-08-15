// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/homebaru.dart';
import 'package:aplikasi_bengkelsehat/pages/login_page.dart';
import 'package:aplikasi_bengkelsehat/pages/transaksi.dart';
import 'package:aplikasi_bengkelsehat/theme.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/widgets/customlist.dart';
import 'package:aplikasi_bengkelsehat/widgets/size_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aplikasi_bengkelsehat/models/size.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/home.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class produk extends StatefulWidget {
  final String id;
  final String namasukucadang;
  final String image;
  final String detailproduk;

  final String stoksukucadang;
  final String promo;
  final String harga;
  final String hrg;
  final String opsi;

  const produk(this.id, this.namasukucadang, this.image, this.detailproduk,
      this.stoksukucadang, this.promo, this.harga, this.hrg, this.opsi,
      {Key? key})
      : super(key: key);

  @override
  State<produk> createState() =>
      // ignore: no_logic_in_create_state
      _produk(
        id,
        namasukucadang,
        image,
        detailproduk,
        stoksukucadang,
        promo,
        harga,
        hrg,
        opsi,
      );
}

// ignore: camel_case_types
class _produk extends State<produk> {
  final String _id;
  final String _namasukucadang;
  final String _image;
  final String _detailproduk;

  final String _stoksukucadang;
  final String _promo;
  final String _harga;
  final String _hrg;
  // ignore: unused_field
  final String _opsi;

  _produk(this._id, this._namasukucadang, this._image, this._detailproduk,
      this._stoksukucadang, this._promo, this._harga, this._hrg, this._opsi);

  String beli = '';
  String service = '';
  bool pilihbeli = false;
  bool pilihservice = false;
  String opsi = '';
  bool isLoggedIn = false;

  void _clickbeli() {
    setState(() {
      opsi = 'Beli';
      beli = '';
      service = '';

      pilihbeli = true;
      pilihservice = false;
    });
  }

  void _clickservice() {
    setState(() {
      opsi = 'Service';
      beli = '';
      service = '';

      pilihbeli = false;
      pilihservice = true;
    });
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      // Pengguna sudah login
      setState(() {
        isLoggedIn = true;
      });
    } else {
      // Pengguna belum login
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    _image,
                    width: MediaQuery.of(context).size.width,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
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
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/Search.png',
                            width: 25,
                            height: 25,
                          ),
                        ),
                        const SizedBox(width: 14),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/three line.png',
                            width: 25,
                            height: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), //color of shadow
                      spreadRadius: 2, //spread radius
                      blurRadius: 4, // blur radius
                      offset: const Offset(0, 1), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _namasukucadang,
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            // ignore: unnecessary_brace_in_string_interps
                            'Rp. ${_harga}',
                            style: body2reguler,
                          ),
                          Text(
                            // ignore: unnecessary_brace_in_string_interps
                            'Rp. ${_hrg}',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: const Color(0xffF45050),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2.0,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            _stoksukucadang,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 23),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 52,
                color: const Color(0xffF0F0F0),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Detail Produk',
                      style: body3bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 30,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    _detailproduk,
                    style: body5reguler,
                  ),
                ),
              ),
              const SizedBox(height: 11),
              Container(
                height: 52,
                color: const Color(0xffF0F0F0),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: _clickbeli,
                        child: sizecard(
                          Size(
                            id: '1',
                            selected: 'Beli',
                            isActive: pilihbeli,
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      InkWell(
                        onTap: _clickservice,
                        child: sizecard(
                          Size(
                            id: '2',
                            selected: 'Service',
                            isActive: pilihservice,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                child: Container(
                  color: const Color(0xff3C486B),
                  width: MediaQuery.of(context).size.width,
                  height: 71,
                  child: TextButton(
                    child: Text(
                      'Pilih Produk',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      checkLoginStatus(); // Perbarui status login sebelum navigasi
                      if (isLoggedIn) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => transaksi(
                              _id,
                              _namasukucadang,
                              _image,
                              _detailproduk,
                              _stoksukucadang,
                              _promo,
                              _harga,
                              _hrg,
                              opsi,
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const loginpage(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
