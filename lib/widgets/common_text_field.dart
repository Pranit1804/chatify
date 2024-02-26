// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:chatify/common/constants/layout_constants.dart';
import 'package:chatify/common/theme/new_theme/color_theme/custom_color_theme_extension.dart';
import 'package:chatify/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:chatify/common/theme/new_theme/text_theme/custom_text_theme_extension.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;
  final String? hintText;
  final bool obscureText;

  final Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    required this.textController,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: LayoutConstants.dimen_8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: LayoutConstants.dimen_1,
                  color: AppColor.bodyTextLightMode,
                ),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(bottom: LayoutConstants.dimen_4),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      obscureText: obscureText,
                      onChanged: onChanged,
                      cursorHeight: 16,
                      controller: textController,
                      style: Theme.of(context)
                          .extension<CustomTextTheme>()!
                          .bodyLM,
                      cursorColor: Theme.of(context)
                          .extension<CustomColorTheme>()!
                          .icon1,
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: Theme.of(context)
                            .extension<CustomTextTheme>()!
                            .bodyLR,
                        isDense: true,
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
