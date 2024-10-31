import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../constants/app_colors.dart';
import 'shimmer/shimmer_base.dart';

class CachedNetworkImageCustom extends StatelessWidget {
  final String imageUrl;
  final String? errorImage;
  final double? height, width;
  final bool isProfilePhoto, isBoxFitContain, isLogo, isGroup;
  final BoxFit? fit;
  final Color? errorImageColor;

  const CachedNetworkImageCustom({
    super.key,
    required this.imageUrl,
    this.isProfilePhoto = false,
    this.isLogo = false,
    this.isGroup = false,
    this.isBoxFitContain = false,
    this.height,
    this.width,
    this.fit,
    this.errorImage,
    this.errorImageColor,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height ?? null,
      width: width ?? null,
      fit: fit ?? (isProfilePhoto ? BoxFit.cover : BoxFit.cover),
      placeholder: (context, url) => ShimmerBase(
        child: Container(
          height: height,
          width: width,
          color: AppColor.grey,
        ),
      ),
      errorWidget: (context, url, error) {
        return const Icon(
          Icons.image,
        );
        // return Image.asset(
        //   isProfilePhoto
        //       ?  singleAvatar
        //       : isLogo
        //           ? logoImage
        //           : errorImage ?? logoImage,
        //   height: height,
        //   width: width,
        //   fit: isProfilePhoto
        //       ? BoxFit.cover
        //       : isBoxFitContain
        //           ? BoxFit.contain
        //           : null,
        // );
      },
    );
  }
}
