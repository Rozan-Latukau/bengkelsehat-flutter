// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/home.dart';

import 'package:flutter/material.dart';
// ignore: unused_import, duplicate_import
import 'package:aplikasi_bengkelsehat/pages/home.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/pages/shop_page.dart';

class Customshop extends StatelessWidget {
  final String image;

  // ignore: use_key_in_widget_constructors
  const Customshop({required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: const Color(0xff3C486B),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: 35,
                height: 35,
              ),
            ),
          ),
        )
      ],
    );
  }
}
