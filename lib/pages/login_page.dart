import 'package:aplikasi_bengkelsehat/pages/Registrase_page.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/home.dart';
import 'package:aplikasi_bengkelsehat/pages/homebaru.dart';
import 'package:aplikasi_bengkelsehat/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/produk_page.dart';

// ignore: camel_case_types
class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<loginpage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    'Silahkan Login Terlebih \nDahulu',
                    style: body2reguler,
                  ),
                ),
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
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _doLogin();
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: const Color(0xff3C486B),
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Lupa Password ?',
                  style: body5reguler,
                ),
                const SizedBox(height: 56),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: const Color(0xff3C486B),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Masuk Dengan',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const registrasipage(),
                        ),
                      );
                    },
                    child: Text(
                      'Belum punya akun? daftar Sekarang',
                      style: body5reguler,
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

  _doLogin() async {
    try {
      var email = _emailController.text;
      var pass = _passwordController.text;

      // ignore: avoid_print
      print('sedang login');
      var res = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );

      // ignore: avoid_print
      print('Hasil Login : ');
      // ignore: avoid_print
      print(res);

      const snackBar = SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Berhasil Login"),
        backgroundColor: Colors.green,
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return homeprofil();
      }));
    } catch (e) {
      // ignore: avoid_print
      print('exception login');
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
