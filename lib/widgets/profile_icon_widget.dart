import 'package:chatify/common/constants/layout_constants.dart';
import 'package:chatify/common/extensions/screen_utils_extensions.dart';
import 'package:chatify/common/theme/new_theme/color_theme/custom_color_theme_extension.dart';
import 'package:flutter/material.dart';

class ProfileIcon extends StatefulWidget {
  final double? height;
  final double? width;
  const ProfileIcon({super.key, this.height, this.width});

  @override
  State<ProfileIcon> createState() => _ProfileIconState();
}

class _ProfileIconState extends State<ProfileIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? LayoutConstants.dimen_44.h,
      width: widget.width ?? LayoutConstants.dimen_44.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).extension<CustomColorTheme>()!.icon1!,
      ),
      child: Icon(
        Icons.person,
        color:
            Theme.of(context).extension<CustomColorTheme>()!.reverseTextColor!,
      ),
    );
  }
}
