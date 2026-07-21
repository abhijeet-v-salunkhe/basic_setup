import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CommonShimmerEffectWidget extends StatelessWidget {
  const CommonShimmerEffectWidget({
    super.key,
    this.containerHeight,
    this.containerWidth,
    this.itemCount = 1,
  });

  final double? containerHeight;
  final double? containerWidth;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          width: containerWidth ?? 50,
          height: containerHeight ?? 200,
        ),
      ),
    );
  }
}
