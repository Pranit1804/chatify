import 'package:chatify/common/constants/layout_constants.dart';
import 'package:chatify/common/extensions/screen_utils_extensions.dart';
import 'package:chatify/common/theme/new_theme/color_theme/custom_color_theme_extension.dart';
import 'package:chatify/common/theme/new_theme/text_theme/custom_text_theme_extension.dart';
import 'package:chatify/modules/chat/data/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WhiteMessageBubble extends StatelessWidget {
  final ChatModel chat;

  const WhiteMessageBubble(this.chat, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: LayoutConstants.dimen_10.h),
          padding: const EdgeInsets.only(
            left: LayoutConstants.dimen_12,
            right: LayoutConstants.dimen_12,
            top: LayoutConstants.dimen_8,
            bottom: LayoutConstants.dimen_8,
          ),
          decoration: BoxDecoration(
            color:
                Theme.of(context).extension<CustomColorTheme>()!.bubbleColor!,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(LayoutConstants.dimen_30),
              topLeft: Radius.circular(LayoutConstants.dimen_30),
              bottomRight: Radius.circular(LayoutConstants.dimen_30),
            ),
          ),
          child: Row(
            children: [
              Text(
                chat.message,
                textAlign: TextAlign.left,
                style: Theme.of(context).extension<CustomTextTheme>()!.bodyLM,
              ),
              SizedBox(width: LayoutConstants.dimen_10.h),
              Padding(
                padding: const EdgeInsets.only(top: LayoutConstants.dimen_12),
                child: Text(DateFormat("hh:mm a").format(chat.createdAt),
                    style:
                        Theme.of(context).extension<CustomTextTheme>()!.bodySM),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
