import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({Key? key, required this.height, required this.width}) : super(key: key);
  final double height ;
  final double width ;

  @override
  Widget build(BuildContext context) {
    return  Card(
      shadowColor: Colors.black,
      elevation: 0,
      // margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Shimmer.fromColors(
        baseColor: const Color(0xffD3D3D3),
        highlightColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.r),
              color: Colors.black,
            ),
            height: height,
            width: width,
          ),
        ),
      ),
    );
  }
}
