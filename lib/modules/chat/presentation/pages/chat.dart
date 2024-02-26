import 'package:chatify/common/constants/layout_constants.dart';
import 'package:chatify/common/extensions/screen_utils_extensions.dart';
import 'package:chatify/common/theme/new_theme/color_theme/custom_color_theme_extension.dart';
import 'package:chatify/common/theme/new_theme/text_theme/custom_text_theme_extension.dart';
import 'package:chatify/common/utils/app_utils.dart';
import 'package:chatify/di/injector.dart';
import 'package:chatify/local_database/user_store.dart';
import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:chatify/modules/chat/bloc/chat_bloc.dart';
import 'package:chatify/modules/chat/data/models/chat_model.dart';
import 'package:chatify/modules/chat/presentation/widgets/chat_bubbles.dart';
import 'package:chatify/widgets/pop_button.dart';
import 'package:chatify/widgets/profile_icon_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final UserEntity friend;
  const Chat({super.key, required this.friend});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _messageController = TextEditingController();

  late ChatBloc _chatBloc;

  @override
  void initState() {
    super.initState();
    _chatBloc = Injector.resolve<ChatBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomColorTheme>()!.homeBackground!,
      body: Container(
        padding: const EdgeInsets.all(LayoutConstants.dimen_16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                PopButton(
                  size: LayoutConstants.dimen_22.h,
                ),
                SizedBox(width: LayoutConstants.dimen_10.w),
                ProfileIcon(
                  height: LayoutConstants.dimen_36.h,
                  width: LayoutConstants.dimen_36.w,
                ),
                SizedBox(width: LayoutConstants.dimen_10.w),
                Text(
                  widget.friend.username,
                  style:
                      Theme.of(context).extension<CustomTextTheme>()!.bodyXLM,
                ),
              ],
            ),
            SizedBox(height: LayoutConstants.dimen_20.w),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(
                        'chats/${AppUtils.getConversationID(UserStore.getUser()!, widget.friend.userId)}/messages/')
                    .snapshots(),
                builder: (context, snapshot) {
                  final List<ChatModel> chats = snapshot.data?.docs
                          .map((e) => ChatModel.fromJson(e.data()))
                          .toList() ??
                      [];
                  if (chats.isNotEmpty) {
                    chats.sort((a, b) => a.createdAt.compareTo(b.createdAt));
                    return ListView.builder(
                      itemCount: chats.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding:
                            EdgeInsets.only(top: LayoutConstants.dimen_8.h),
                        child: ChatsBubble(chat: chats[index]),
                      ),
                    );
                  } else {
                    return const Expanded(
                        child: Center(child: Text('Say Hii!!')));
                  }
                }),
            const Spacer(),
            sendMessageWidget(),
          ],
        ),
      ),
    );
  }

  void onMessageSend() {
    if (_messageController.text.isNotEmpty) {
      _chatBloc.add(
        SendMessageEvent(
            reciever: widget.friend, message: _messageController.text),
      );
      _messageController.clear();
    }
  }

  Widget sendMessageWidget() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration: InputDecoration(
              hintText: 'Type a message...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
        ),
        SizedBox(width: LayoutConstants.dimen_4.h),
        IconButton(
          icon: Icon(Icons.send,
              color: Theme.of(context)
                  .extension<CustomColorTheme>()!
                  .primaryButtonColor!),
          onPressed: onMessageSend,
        ),
      ],
    );
  }
}
