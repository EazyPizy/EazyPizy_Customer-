import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {


  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  ];
  int caroIndex = 0;
  @override
  Widget build(BuildContext context) {
    return
    CarouselSlider(
        items: imageList.map((url) {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Image.network(url,
            fit: BoxFit.cover, width: 500.0),
      );
    }).toList(), options: CarouselOptions(
      autoPlay: true,
      aspectRatio: 2.0,
      enlargeCenterPage: true,

      scrollDirection: Axis.horizontal,


    ),);
  }
}
