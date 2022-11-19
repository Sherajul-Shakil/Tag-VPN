// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, unused_local_variable, avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../utils/constants/constants.dart';

class MySlider extends StatefulWidget {
  double height;
  double width;

  MySlider({
    required this.height,
    required this.width,
  });

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: onBordingImageList.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              child: Image.asset(
                onBordingImageList[index],
                height: widget.height,
                width: widget.width,
                fit: BoxFit.cover,
              ),
            );
          },
          options: CarouselOptions(
            height: widget.height,
            viewportFraction: 0.95,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: widget.height * 0.02),
        buildIndicator(onBordingImageList.length),
      ],
    );
  }

  Widget buildIndicator(int length) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: length,
        effect: ScrollingDotsEffect(
          dotHeight: 8,
          dotWidth: 8,
          dotColor: Colors.grey.withOpacity(0.2),
          activeDotColor: Colors.grey.withOpacity(0.6),
        ),
      );
}
