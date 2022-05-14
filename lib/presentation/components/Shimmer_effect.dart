import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:know_news/presentation/components/shimmer.dart';

class Shimmer extends StatelessWidget {
  const Shimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ShimmerContainer(height: 120, width: 120),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ShimmerContainer(height: 13.h, width: 350.w),
              ShimmerContainer(height: 13.h, width: 350.w),
              ShimmerContainer(height: 13.h, width: 350.w),
              ShimmerContainer(height: 13.h, width: 350.w),
              ShimmerContainer(height: 13.h, width: 150.w),
            ],
          ),
        )
      ],
    );
  }
}
