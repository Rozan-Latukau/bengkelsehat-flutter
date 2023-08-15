// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/form_keluhan.dart';
import 'package:aplikasi_bengkelsehat/pages/home.dart';
import 'package:aplikasi_bengkelsehat/pages/login_page.dart';
import 'package:aplikasi_bengkelsehat/pages/notif.dart';
import 'package:aplikasi_bengkelsehat/pages/shop_baru.dart';
import 'package:aplikasi_bengkelsehat/widgets/customlist.dart';
import 'package:aplikasi_bengkelsehat/widgets/sukucadang.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
// ignore: duplicate_import
import 'package:aplikasi_bengkelsehat/widgets/sukucadang.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/shop_page.dart';
import 'package:aplikasi_bengkelsehat/pages/riwayat_page.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class homeprofil extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _homeprofil createState() => _homeprofil();
}

// ignore: camel_case_types
class _homeprofil extends State<homeprofil> {
  int currentIndex = 0;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    // ignore: unnecessary_null_comparison
    if (loginpage != null) {
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

  final List<Widget> myslider = [
    SizedBox(
      width: 348,
      height: 130,
      child: Image.asset(
        'assets/slider1.png',
      ),
    ),
    SizedBox(
      width: 348,
      height: 130,
      child: Image.asset(
        'assets/slider2.png',
      ),
    ),
    SizedBox(
      width: 348,
      height: 130,
      child: Image.asset(
        'assets/slider3.png',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference sukucadang = firestore.collection('sukucadang');
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
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const notif(),
                  ),
                );
              },
              child: Image.asset(
                'assets/notif.png',
                width: 35,
                height: 35,
              ),
            ),
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

    // Body Awal
    Widget body() {
      return Padding(
        padding: const EdgeInsets.only(
          left: 30,
          top: 28,
          right: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Selamat Datang di Bengkel \nSehat...',
              style: GoogleFonts.poppins(
                color: const Color(0xff3C486B),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    autoPlayAnimationDuration: const Duration(seconds: 1)),
                items: myslider.toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                width: 333,
                height: 54,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: const Color(0xff3C486B),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => homepage(),
                      ),
                    );
                  },
                  child: Text(
                    'LogOut',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 333,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: const Color(0xff3C486B),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const keluhan(),
                    ),
                  );
                },
                child: Text(
                  'Keluhan',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Rekomendasi',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: const Color(0xff3C486B),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  'Lihat Semua',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xffF45050),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 11),
            StreamBuilder<QuerySnapshot>(
              stream: sukucadang
                  .orderBy('id', descending: false)
                  .limit(2)
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // ignore: unnecessary_cast
                      children: (snapshot.data! as QuerySnapshot)
                          .docs
                          .map(
                            (e) => customlist(
                              id: e['id'],
                              namasukucadang: e['namasukucadang'],
                              image: e['image'],
                              promo: e['promo'],
                              harga: e['harga'],
                              hrg: e['hrg'],
                              detailproduk: e['detailproduk'],
                              opsi: e['opsi'],
                              stoksukucadang: e['stoksukucadang'],
                            ),
                          )
                          .toList(),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Ban',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: const Color(0xff3C486B),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  'Lihat Semua',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xffF45050),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            StreamBuilder<QuerySnapshot>(
              stream: sukucadang
                  .where('id', whereIn: ['3', '4'])
                  .orderBy('id', descending: false)
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // ignore: unnecessary_cast
                      children: (snapshot.data! as QuerySnapshot)
                          .docs
                          .map(
                            (e) => cadang(
                              id: e['id'],
                              namasukucadang: e['namasukucadang'],
                              image: e['image'],
                              promo: e['promo'],
                              harga: e['harga'],
                              hrg: e['hrg'],
                              detailproduk: e['detailproduk'],
                              opsi: e['opsi'],
                              stoksukucadang: e['stoksukucadang'],
                            ),
                          )
                          .toList(),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color(0xffF0F0F0),
          selectedItemColor: const Color(0xffF9D949),
          currentIndex: currentIndex,
          elevation: 0,
          backgroundColor: const Color(0xff3C486B),
          iconSize: 35,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/home.png'),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/shop.png'),
              ),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/note.png'),
              ),
              label: 'Transaksi',
            ),
          ],
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });

            if (currentIndex == 1) {
              // Navigasi ke halaman kedua (Shop)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => shopbaru(),
                ),
              );
            } else if (currentIndex == 2) {
              // Navigasi ke halaman ketiga (Transaksi)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const riwayat(),
                ),
              );
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            body(),
          ],
        ),
      ),
    );
  }
}
