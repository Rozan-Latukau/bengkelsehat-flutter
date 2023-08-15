// ignore: unused_import
import 'package:aplikasi_bengkelsehat/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aplikasi_bengkelsehat/widgets/customkeluhan.dart';

// ignore: camel_case_types
class keluhan extends StatelessWidget {
  const keluhan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference sukucadang = firestore.collection('sukucadang');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 30,
                  right: 30,
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 33,
                  left: 30,
                  right: 30,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD9D9D9),
                    filled: true,
                    labelText: 'ID plat nomor',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 33,
                  left: 30,
                  right: 30,
                ),
                child: Text(
                  'Silahkan isi Keluhan Anda',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 11),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: StreamBuilder<QuerySnapshot>(
                  stream: sukucadang
                      .orderBy('id', descending: false)
                      .limit(2)
                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          // ignore: unnecessary_cast
                          children: (snapshot.data! as QuerySnapshot)
                              .docs
                              .map(
                                (e) => customkeluhan(
                                  id: e['id'],
                                  namasukucadang: e['namasukucadang'],
                                  image: e['image'],
                                  promo: '',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
