
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_constant.dart';
import '../constants/my_text_style.dart';

class AppButton extends StatelessWidget {
  final String text, assetImage;
  final IconData? icon;
  final double fontSize,
      borderRadius,
      borderWidth,
      assetImageWidth,
      iconSize,
      gapSize;
  final bool isTextPrimaryColor,
      needBorderColor,
      isTextBlack,
      needOnlyBorder,
      needAssetImage,
      needIcon,
      needRightAssetImage,
      needLoading;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final Color textColor, backgroundColor, iconColor, borderColor;
  final Color? rightImageColor;
  final void Function()? onPressed;
  final double leftRightPadding, buttonHeight;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.assetImage = "",
    this.fontSize = 20,
    this.gapSize = 5.0,
    this.borderWidth = 2,
    this.iconSize = 50.0,
    this.borderRadius = 6.0,
    this.leftRightPadding = 16,
    this.buttonHeight = 60,
    this.assetImageWidth = 50.0,
    this.textColor = AppColor.white,
    this.iconColor = AppColor.white,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.center,
    this.backgroundColor = AppColor.primaryColor,
    this.needIcon = false,
    this.needOnlyBorder = false,
    this.isTextBlack = false,
    this.needAssetImage = false,
    this.isTextPrimaryColor = false,
    this.needRightAssetImage = false,
    this.needBorderColor = false,
    this.borderColor = AppColor.primaryColor,
    this.needLoading = false,
    this.rightImageColor = AppColor.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      child: needOnlyBorder
          ? OutlinedButton(
        style: style(),
        onPressed: needLoading ? () {} : onPressed,
        child: childDesign(),
      )
          : ElevatedButton(
        style: style(),
        onPressed: needLoading ? () {} : onPressed,
        child: childDesign(),
      ),
    );
  }

  Widget childDesign() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: leftRightPadding,vertical:  8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (needAssetImage)
            SizedBox(
              width: assetImageWidth,
              child: Image.asset(
                assetImage,
                // color: AppColor.white,
              ),
            ),
          if (needIcon)
            Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
          if (needAssetImage || needIcon) gapW(gapSize),
          if (needLoading)
            const CircularProgressIndicator(
              color: AppColor.white,
            )
          else
            Flexible(
              child: Text(
                text,
                textAlign: textAlign,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: text20Style(
                  color: isTextBlack
                      ? AppColor.black
                      : isTextPrimaryColor
                      ? AppColor.primaryColor
                      : textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ),
          if (needRightAssetImage)
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: assetImageWidth,
              child: Image.asset(
                assetImage,
                color: rightImageColor,
              ),
            ),
        ],
      ),
    );
  }

  ButtonStyle? style() {
    return ElevatedButton.styleFrom(
      elevation: needOnlyBorder ? 0 : .5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: EdgeInsets.zero,
      backgroundColor: needOnlyBorder ? Colors.transparent : backgroundColor,
      side: needOnlyBorder
          ? BorderSide(
        width: borderWidth,
        color: borderColor,
      )
          : null,
    );
  }
}