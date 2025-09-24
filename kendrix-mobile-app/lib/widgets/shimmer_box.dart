import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final BorderRadius? borderRadiusObject;
  final EdgeInsets? margin;

  const ShimmerBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.borderRadiusObject,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 20.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadiusObject ?? BorderRadius.circular(borderRadius ?? 4.0),
          ),
        ),
      ),
    );
  }
}