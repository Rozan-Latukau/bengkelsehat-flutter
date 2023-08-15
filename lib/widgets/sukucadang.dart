import 'package:aplikasi_bengkelsehat/pages/produk_page.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/home.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/theme.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/shop_page.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/transaksi.dart';

// ignore: camel_case_types
class cadang extends StatelessWidget {
  final String id;
  final String namasukucadang;
  final String image;
  final String detailproduk;

  final String stoksukucadang;
  final String promo;
  final String harga;
  final String hrg;
  final String opsi;

  const cadang({
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
    return Row(
      children: [
        Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Color(0xff767676),
                spreadRadius: 0,
                blurRadius: 4,
                blurStyle: BlurStyle.normal,
              ),
            ],
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
              opacity: 10.6,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 12,
              top: 6,
              bottom: 6,
              right: 6,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  namasukucadang,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  // ignore: unnecessary_brace_in_string_interps
                  'Rp. ${harga}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Center(
                  child: SizedBox(
                    width: 190.0,
                    height: 30.0,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: const Color(0xff3C486B),
                      ),
                      onPressed: () {
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
                      child: Text(
                        'Pilih',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 26),
      ],
    );
  }
}
