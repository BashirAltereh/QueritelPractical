import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/app_colors.dart';

class CustomShimmer extends StatelessWidget {
  CustomShimmer.normal({
    Key? key,
    this.height,
    this.width,
  })  : _borderRadius = BorderRadius.circular(0),
        super(key: key);

  CustomShimmer.circular({
    Key? key,
    this.height,
    this.width,
  })  : _borderRadius = BorderRadius.circular(100),
        super(key: key);

  CustomShimmer.squarer({
    Key? key,
    this.height,
    this.width,
  })  : _borderRadius = BorderRadius.circular(4),
        super(key: key);

  final double? height;
  final double? width;
  final BorderRadius _borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300] ?? const Color(0xFF757575),
      highlightColor: Colors.grey[100] ?? const Color(0xFF757575),
      enabled: true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: Colors.white,
        ),
        height: height,
        width: width,
      ),
    );
  }
}

class GridLoading extends StatelessWidget {
  const GridLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Shimmer.fromColors(
            baseColor: AppColors.gray.withOpacity(0.3),
            highlightColor: AppColors.gray.withOpacity(0.1),
            enabled: true,
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1.2, crossAxisSpacing: 2.2, mainAxisSpacing: 15),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsLoading extends StatelessWidget {
  const DetailsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
        baseColor: AppColors.gray.withOpacity(0.3),
        highlightColor: AppColors.gray.withOpacity(0.1),
        enabled: true,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                List<double> temp = [
                  size.width,
                  size.width / 1.6,
                  size.width / 1.4,
                  size.width / 1.2,
                ];
                Random rnd = Random();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: temp[rnd.nextInt(temp.length - 1)],
                      height: 10.0,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                );
              },
              itemCount: 6,
            )));
  }
}

class TextLoading extends StatelessWidget {
  const TextLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
        baseColor: AppColors.gray.withOpacity(0.3),
        highlightColor: AppColors.gray.withOpacity(0.1),
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            width: size.width / 2,
            height: 10.0,
            color: Colors.white,
          ),
        ));
  }
}
