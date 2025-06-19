// home_banaras_item
import 'package:abg/res/configuration/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBanarItem extends StatelessWidget {
  final String imageUrl;

  const HomeBanarItem({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomImage.network(
      imageUrl,
        borderRadius: BorderRadius.circular(5),
        height: 120,
        width: 381.w,
        fit: BoxFit.cover);
  }
}
