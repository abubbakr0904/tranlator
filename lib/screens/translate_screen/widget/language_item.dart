import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:translate/utils/images/app_images.dart';
import 'package:translate/utils/style/app_style.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({super.key, required this.lan1, required this.lan2, required this.image1, required this.image2, required this.onTap});
  final String lan1;
  final String lan2;
  final String image1;
  final String image2;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(11.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                spreadRadius: 0,
                blurRadius: 4,
                color: Colors.grey.withOpacity(0.5))
          ],
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image.asset(image1,
                    width: 24.w, height: 24.w, fit: BoxFit.cover),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                lan1,
                style:
                AppTextStyle.robotoMedium.copyWith(fontSize: 16.sp),
              )
            ],
          ),
          IconButton(
            onPressed: onTap,
            icon: const Image(
              fit: BoxFit.cover,
              image: Svg(AppImages.changeIcon),
            ),
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image.asset(image2,
                    width: 24.w, height: 24.w, fit: BoxFit.cover),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                lan2,
                style:
                AppTextStyle.robotoMedium.copyWith(fontSize: 16.sp),
              )
            ],
          ),
        ],
      ),
    );
  }
}
