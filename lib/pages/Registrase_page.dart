// ignore_for_file: file_names, unused_local_variable

import 'package:aplikasi_bengkelsehat/pages/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aplikasi_bengkelsehat/theme.dart';

// ignore: camel_case_types
class registrasipage extends StatefulWidget {
  const registrasipage({super.key});

  // ignore: library_private_types_in_public_api
  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<registrasipage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // ignore: non_constant_identifier_names
  var nama = '';
  var alamat = '';
  var email = '';
  var nohp = '';
  var pass = '';
  var konfipass = '';

  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 30,
            right: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Silahkan Daftar Terlebih \nDahulu',
                  style: body2reguler,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD9D9D9),
                    filled: true,
                    labelText: 'Nama',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide.none),
                  ),
                  onChanged: (v) {
                    nama = v;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD9D9D9),
                    filled: true,
                    labelText: 'Alamat',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide.none),
                  ),
                  onChanged: (v) {
                    alamat = v;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD9D9D9),
                    filled: true,
                    labelText: 'Email',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide.none),
                  ),
                  onChanged: (v) {
                    email = v;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD9D9D9),
                    filled: true,
                    labelText: 'No Hp',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide.none),
                  ),
                  onChanged: (v) {
                    nohp = v;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD9D9D9),
                    filled: true,
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide.none),
                  ),
                  onChanged: (v) {
                    pass = v;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD9D9D9),
                    filled: true,
                    labelText: 'Konfirmasi Password',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide.none),
                  ),
                  onChanged: (v) {
                    konfipass = v;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      var collection =
                          FirebaseFirestore.instance.collection('pelanggan');
                      var res = await collection.add({
                        'nama': nama,
                        'alamat': alamat,
                        'email': email,
                        'No Hp': nohp,
                        'password': pass,
                        'Konfirmasi Password': konfipass
                      });

                      // ignore: avoid_print
                      print(res);
                      _doSignUp();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: const Color(0xff3C486B),
                    ),
                    child: Text(
                      'Daftar',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
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

  _doSignUp() async {
    try {
      var email = _emailController.text;
      var pass = _passwordController.text;

      // ignore: avoid_print
      print('sedang daftar');
      var res = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      // ignore: avoid_print
      print('Hasil Daftar : ');
      // ignore: avoid_print
      print(res);

      const snackBar = SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Registrasi Berhasil, Silakan Login"),
        backgroundColor: Colors.green,
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return const loginpage();
      }));
    } catch (e) {
      // ignore: avoid_print
      print('exception daftar');
      // ignore: avoid_print
      print(e.runtimeType);
      if (e is FirebaseAuthException) {
        // ignore: avoid_print
        print(e);
        // ignore: avoid_print
        print(e.message);
      }

      const snackBar = SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Email atau Password Salah"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
