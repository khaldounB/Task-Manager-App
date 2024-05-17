// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// Project imports:
import '../../logic/singleton/statics.dart';

class CachedImage extends StatelessWidget {
  const CachedImage(
      {super.key,
      required this.url,
      required this.placeholder,
      this.boxFit = BoxFit.cover,
      required this.w,
      required this.h,
      this.radius = 0,
      this.child = const SizedBox(),
      this.isCircle = false,
      this.fromOrder = false,});
  final String url;
  final Widget placeholder;
  final BoxFit boxFit;
  final double w;
  final double h;
  final double radius;
  final bool isCircle;
  final bool fromOrder;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => placeholder,
      errorWidget: (context, url, error) => Container(
        width: w== 1000 ? double.infinity: width(w),
        height: h== 1000 ? double.infinity:height(h),
        decoration: isCircle
            ? BoxDecoration(
                shape: BoxShape.circle,

                image: DecorationImage(
                  image:
                      const AssetImage('assets/images/icon.png'),
                  fit: boxFit,
                  filterQuality: FilterQuality.high,
                ),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(width(radius)),
                image: DecorationImage(
                  image:
                      const AssetImage('assets/images/icon.png'),
                  fit: boxFit,
                  filterQuality: FilterQuality.high,
                ),
              ),
      ),
      imageBuilder: (context, imageProvider) => Container(
        width: width(w),
        height: height(h),
        decoration: isCircle
            ? BoxDecoration(
                shape: BoxShape.circle,
          border: Border.all(color:fromOrder ?  color.kScaffoldColor:Colors.transparent,width: width(1)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: boxFit,
                  filterQuality: FilterQuality.high,
                ),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(width(radius)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: boxFit,
                  filterQuality: FilterQuality.high,
                ),
              ),
        child: child,
      ),
    );
  }
}
