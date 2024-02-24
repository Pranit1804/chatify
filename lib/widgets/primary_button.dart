import 'package:chatify/common/constants/layout_constants.dart';
import 'package:chatify/common/extensions/screen_utils_extensions.dart';
import 'package:chatify/common/theme/new_theme/color_theme/custom_color_theme_extension.dart';
import 'package:chatify/common/theme/new_theme/text_theme/custom_text_theme_extension.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final Color? backgroundColor;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback onTap;
  final bool isLoadingState;
  const PrimaryButton({
    super.key,
    this.backgroundColor,
    required this.text,
    required this.onTap,
    this.textStyle,
    this.isLoadingState = false,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: LayoutConstants.dimen_48.h,
        decoration: BoxDecoration(
          color: widget.backgroundColor ??
              Theme.of(context)
                  .extension<CustomColorTheme>()!
                  .primaryButtonColor,
          borderRadius: BorderRadius.circular(LayoutConstants.dimen_16),
        ),
        child: widget.isLoadingState
            ? CircularProgressIndicator(
                backgroundColor:
                    Theme.of(context).extension<CustomColorTheme>()!.icon1!,
                color: Theme.of(context)
                    .extension<CustomColorTheme>()!
                    .reverseTextColor!,
              )
            : Text(
                widget.text,
                style: widget.textStyle ??
                    Theme.of(context).extension<CustomTextTheme>()!.bodyMM,
              ),
      ),
    );
  }
}
