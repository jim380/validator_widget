import 'package:flutter/material.dart';
import 'package:validator_widget/constants/constants.dart';

class MyInfo {
  final String? svgSrc, title, amount;
  final int? percentage;
  final Color? color;

  MyInfo({
    this.svgSrc,
    this.title,
    this.amount,
    this.percentage,
    this.color,
  });
}

List dummyMyInfo = [
  MyInfo(
    title: "Available",
    svgSrc: "assets/icons/Documents.svg",
    amount: "128.43 UMEE",
    color: primaryColor,
    percentage: 1,
  ),
  MyInfo(
    title: "Delegated",
    svgSrc: "assets/icons/drop_box.svg",
    amount: "100.00 UMEE",
    color: const Color(0xFFFFA113),
    percentage: 93,
  ),
  MyInfo(
    title: "Rewards",
    svgSrc: "assets/icons/google_drive.svg",
    amount: "6.37 UMEE",
    color: const Color(0xFF007EE5),
    percentage: 2,
  ),
  MyInfo(
    title: "Commission",
    svgSrc: "assets/icons/one_drive.svg",
    amount: "241,554.95 UMEE",
    color: const Color(0xFFA4CDFF),
    percentage: 4,
  ),
];
