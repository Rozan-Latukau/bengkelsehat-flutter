// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/home.dart';
import 'package:aplikasi_bengkelsehat/pages/homebaru.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_bengkelsehat/widgets/cutomshop.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aplikasi_bengkelsehat/widgets/sukucadang.dart';
import 'package:aplikasi_bengkelsehat/pages/riwayat_page.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/widgets/customlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aplikasi_bengkelsehat/pages/login_page.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class shopbaru extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _shopbaru createState() => _shopbaru();
}

// ignore: camel_case_types
class _shopbaru extends State<shopbaru> {
  int currentIndex = 1;
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

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference sukucadang = firestore.collection('sukucadang');
    // Header Awal
    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Column(
          children: [
            Row(
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
            const SizedBox(height: 25),
            TextField(
              onChanged: (value) {
                // Panggil fungsi pencarian di sini
              },
              decoration: InputDecoration(
                fillColor: const Color(0xffD9D9D9),
                filled: true,
                hintText: 'Pencarian',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  Customshop(image: 'assets/oli.png'),
                  SizedBox(width: 20),
                  Customshop(image: 'assets/oli.png'),
                  SizedBox(width: 20),
                  Customshop(image: 'assets/oli.png'),
                  SizedBox(width: 20),
                  Customshop(image: 'assets/oli.png'),
                  SizedBox(width: 20),
                  Customshop(image: 'assets/oli.png'),
                ],
              ),
            )
          ],
        ),
      );
    }
    // Header AKhir

    // Body awal
    Widget body() {
      return Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 24,
        ),
        child: Column(
          children: [
            // Apa yang baru//
            Row(
              children: [
                Text(
                  'Apa yang baru ?',
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
                  .where('id', whereIn: ['5', '6'])
                  .orderBy('id', descending: false)
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
            // sparepart
            const SizedBox(height: 26),
            Row(
              children: [
                Text(
                  'Spare Part',
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
                  .where('id', whereIn: ['7', '8'])
                  .orderBy('id', descending: false)
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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

    // Body Akhir
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

            if (currentIndex == 0) {
              // Navigasi ke halaman kedua (Shop)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => homeprofil(),
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
