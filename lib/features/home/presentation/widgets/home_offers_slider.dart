import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/shared/components/dots_indicator.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/media_query_extension.dart';

class HomeOffersSlider extends StatefulWidget {
  const HomeOffersSlider({super.key});

  @override
  State<HomeOffersSlider> createState() => _HomeOffersSliderState();
}

class _HomeOffersSliderState extends State<HomeOffersSlider> {
  final _controller = CarouselSliderController();
  int _currentIndex = 0;

  final List<String> _images = [
    AssetsConst.promoBanner,
    AssetsConst.promoBanner1,
    AssetsConst.promoBanner2,
    AssetsConst.promoBanner3,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: _carouselOptions(),
          items: _images
              .map((image) => Builder(builder: (_) => _carouselCard(image)))
              .toList(),
        ),
        Positioned(
          bottom: context.spacing.s8,
          child: DotsIndicator(
            length: _images.length,
            currentPage: _currentIndex,
          ),
        ),
      ],
    );
  }

  Container _carouselCard(String image) {
    final borderRadius = context.borderRadius.borderRadius24;
    return Container(
      width: context.sWidth,
      decoration: BoxDecoration(borderRadius: borderRadius),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }

  CarouselOptions _carouselOptions() {
    return CarouselOptions(
      height: context.sWidth / 2,
      viewportFraction: 1.0,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 10),
      enlargeCenterPage: true,
      onPageChanged: (index, reason) {
        setState(() => _currentIndex = index);
      },
    );
  }
}
