// ignore_for_file: file_names

import 'package:get/get.dart';

class HWPM {
  static double height = Get.context.height; //683
  static double width = Get.context.width; //411
  ////////////// padding /////////
  static double pt10 = height / 68.3;
  static double pv10 = height / 68.3;
  static double p15 = height / 45.53;

  static double p20 = height / 34.15;
  // 683/30=22.7
  static double pt30 = height / 22.7;
  // 683/100=6.83
  static double pt100 = height / 6.83;

  static double pt40 = height / 17.075;

  //////////// font size /////////
  static double font20 = height / 34.15;
  static double font30 = height / 22.7;
  static double font40 = height / 17.075;

  ////////////// margin /////////

  static double m20 = height / 34.15;
  static double m10 = height / 68.3;

  ////////////// height /////////
  static double h100 = height / 6.83;
  static double h80 = height / 6.53;
  static double h200 = height / 3.41;
  static double h400 = height / 1.71;
  static double h130 = height / 5.25;

  static double h150 = height / 4.55;
  static double h30 = height / 22.7;
  static double h50 = height / 13.7;

  ////////////// width /////////
  static double w100 = height / 6.83;
  static double w180 = width / 2.283;
  static double w50 = width / 8.22;
  static double w40 = width / 10.275;
  static double w200 = width / 2.00;

  ////////////// button /////////

  static double bw350 = height / 1.95;
  static double bh60 = height / 11.38;

  ////////////// border radius /////////
  static double brcircular100 = height / 6.83;
  static double brcircular10 = height / 68.3;

  // static const TextStyle h1Style =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
}
