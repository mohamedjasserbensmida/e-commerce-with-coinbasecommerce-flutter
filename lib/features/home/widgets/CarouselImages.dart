import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:financeLine/constants/global_variables.dart';

class CategoryImages extends StatefulWidget {
  final List<String> images;

  const CategoryImages({required this.images});

  @override
  _CategoryImagesState createState() => _CategoryImagesState();
}

class _CategoryImagesState extends State<CategoryImages> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.images.map((i) {
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
            viewportFraction: 0.8,
            autoPlay: true,
            aspectRatio: 2.0,
            initialPage: 2,
            pauseAutoPlayOnTouch: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.map((i) {
            int index = widget.images.indexOf(i);
            return Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentImageIndex == index ? Colors.blue : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
