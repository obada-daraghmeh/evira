import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/components/dots_indicator.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../../../../core/shared/widgets/custom_network_image.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/media_query_extension.dart';
import '../controllers/color/color_cubit.dart';

class ProductSectionImage extends StatefulWidget {
  final Product product;
  const ProductSectionImage({super.key, required this.product});

  @override
  State<ProductSectionImage> createState() => _ProductSectionImageState();
}

class _ProductSectionImageState extends State<ProductSectionImage> {
  final PageController _pageController = PageController();
  // int _currentPage = 0;
  // int? _selectedColorIndex;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // void _onSelectedColor(int index) {
  //   if (_selectedColorIndex == index) return;

  //   _selectedColorIndex = index;
  //   // final colorImages = widget.product.colors[index].images;
  //   // if (colorImages.isEmpty) return;

  //   // final targetIndex = widget.product.images.indexWhere(colorImages.contains);
  //   // if (targetIndex == -1) return;

  //   // _pageController.animateToPage(
  //   //   targetIndex,
  //   //   duration: const Duration(milliseconds: 300),
  //   //   curve: Curves.easeInOut,
  //   // );

  //   // setState(() => _currentPage = targetIndex);
  // }

  // Color get _currentGlowColor {
  //   final index = _selectedColorIndex ?? _currentPage;
  //   // final hex = widget.product.colors[index].hexCode;
  //   // return ProductHelpers.colorFromHexCode(hex).withValues(alpha: 0.4);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorCubit, ColorState>(
      // listener: (_, state) => _onSelectedColor(state.index),
      listener: (_, state) {},
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                // gradient: RadialGradient(
                //   colors: [_currentGlowColor, Colors.transparent],
                //   radius: 0.7,
                //   center: Alignment.center,
                // ),
              ),
            ),
          ),
          Container(
            width: context.sWidth,
            height: context.sWidth,
            padding: context.padding.pV48,
            child: PageView.builder(
              // controller: _pageController,
              // itemCount: widget.product.images.length,
              itemCount: 1,
              // onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (_, index) => Hero(
                tag: 'widget.product.thumbnailUrl',
                child: CustomNetworkImage(imageUrl: '', fit: BoxFit.contain),
              ),
            ),
          ),
          Positioned(
            bottom: context.spacing.s16,
            child: DotsIndicator(
              // length: widget.product.images.length,
              length: 3,
              // currentPage: _currentPage,
              currentPage: 1,
            ),
          ),
        ],
      ),
    );
  }
}
