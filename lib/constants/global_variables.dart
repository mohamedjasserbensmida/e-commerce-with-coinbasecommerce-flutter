import 'package:flutter/material.dart';

String uri = 'http://127.0.0.1:3000';

class GlobalVariables {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 152, 201),
      Color.fromARGB(255, 10, 130, 190),
      Color.fromARGB(255, 33, 150, 243)
    ],
    stops: [0.0, 0.5, 1.0],
  );

  /*static const appBarGradient2 = LinearGradient(
    colors: [
      Color.fromARGB(255, 220, 230, 255),
      Color.fromARGB(255, 200, 210, 240),
      Color.fromARGB(255, 180, 190, 220)
    ],
    stops: [0.0, 0.5, 1.0],
  );*/

  static const GradientApp = LinearGradient(
    colors: [
      Color.fromARGB(255, 98, 158, 181),
      Color.fromARGB(255, 92, 141, 166),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(0, 225, 255, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[400]!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const String appUrl = '';

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Sport',
      'image': 'assets/images/sport.jpeg',
    },
    {
      'title': 'Sante',
      'image': 'assets/images/sant.jpeg',
    },
    {
      'title': 'Transport',
      'image': 'assets/images/trans.jpeg',
    },
    {
      'title': 'Technologie',
      'image': 'assets/images/technologie.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpeg',
    },
  ];
}
