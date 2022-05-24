import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  AppBanner({Key? key}) : super(key: key);
  final List<String> _banners = [
    "assets/banners/hinhcuasu.jpg",
    "assets/banners/chipvaba.jpg",
    "assets/banners/hinhcuasu.jpg",
    "assets/banners/chipvaba.jpg",
    "assets/banners/hinhcuasu.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.all(10.0),
        child: CarouselSlider(
            items: _banners
                .map<Widget>((a) => Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: ExactAssetImage(a),
                        ),
                      ),
                      width: size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    ))
                .toList(),
            options: CarouselOptions(
              height: size.height * 0.26,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            )));
  }
}
