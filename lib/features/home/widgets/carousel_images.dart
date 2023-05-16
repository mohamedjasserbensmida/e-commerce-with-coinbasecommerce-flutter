import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:financeLine/constants/global_variables.dart';

class CarouselImages extends StatelessWidget {
  const CarouselImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((i) {
        return Builder(
          builder: (BuildContext context) => Image.network(
            i,
            fit: BoxFit.cover,
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 200,
        enlargeCenterPage: true,
        viewportFraction: 0.9, // agrandir les photos
        autoPlay: true,
        aspectRatio: 2.0,
        initialPage: 2,
        pauseAutoPlayOnTouch: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
