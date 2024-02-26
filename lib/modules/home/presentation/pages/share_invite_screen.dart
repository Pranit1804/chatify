import 'package:chatify/common/constants/layout_constants.dart';
import 'package:chatify/common/extensions/screen_utils_extensions.dart';
import 'package:chatify/common/theme/new_theme/color_theme/custom_color_theme_extension.dart';
import 'package:chatify/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:chatify/common/theme/new_theme/text_theme/custom_text_theme_extension.dart';
import 'package:chatify/common/theme/new_theme/text_theme/default_text_themes.dart';
import 'package:chatify/di/injector.dart';
import 'package:chatify/local_database/user_store.dart';
import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:chatify/modules/home/bloc/home_bloc.dart';
import 'package:chatify/modules/home/home_constants.dart';
import 'package:chatify/routes/routes_constant.dart';
import 'package:chatify/widgets/common_text_field.dart';
import 'package:chatify/widgets/primary_button.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShareInvite extends StatefulWidget {
  const ShareInvite({super.key});

  @override
  State<ShareInvite> createState() => _ShareInviteState();
}

class _ShareInviteState extends State<ShareInvite> {
  late UserEntity userEntity;
  late HomeBloc _homeBloc;
  final TextEditingController _inviteCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userEntity = UserStore.getUser()!;
    _homeBloc = Injector.resolve<HomeBloc>();
  }

  _listenToHomeBloc(BuildContext context, HomeState state) {
    if (state is AddFriendSuccessState) {
      Navigator.pushNamed(context, RoutesConstants.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomColorTheme>()!.homeBackground,
      body: BlocConsumer<HomeBloc, HomeState>(
          bloc: _homeBloc,
          listener: _listenToHomeBloc,
          builder: (context, _) {
            return Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(LayoutConstants.dimen_16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: LayoutConstants.dimen_67.h),
                  shareInviteWidget(),
                  SizedBox(height: LayoutConstants.dimen_52.h),
                  orWidget(),
                  SizedBox(height: LayoutConstants.dimen_52.h),
                  Text(
                    HomeConstants.enterFriendsId,
                    style: Theme.of(context)
                        .extension<CustomTextTheme>()!
                        .bodyLM!
                        .copyWith(
                          color: Theme.of(context)
                              .extension<CustomColorTheme>()!
                              .primaryButtonColor,
                        ),
                  ),
                  SizedBox(height: LayoutConstants.dimen_42.h),
                  CustomTextField(
                    hintText: HomeConstants.enterIDHint,
                    textController: _inviteCodeController,
                  ),
                  SizedBox(height: LayoutConstants.dimen_22.h),
                  PrimaryButton(
                    onTap: () {
                      _homeBloc.add(AddFriendEvent(_inviteCodeController.text));
                    },
                    text: HomeConstants.addFriend,
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget orWidget() {
    return Text(
      HomeConstants.or,
      style: Theme.of(context).extension<CustomTextTheme>()!.bodyLB!.copyWith(
            fontFamily: AppTextTheme.barlowCondensed,
            color: AppColor.lightGreyColor2,
          ),
    );
  }

  Widget shareInviteWidget() {
    return Column(
      children: [
        Text(
          HomeConstants.sendInviteID,
          style:
              Theme.of(context).extension<CustomTextTheme>()!.bodyLM!.copyWith(
                    color: Theme.of(context)
                        .extension<CustomColorTheme>()!
                        .primaryButtonColor,
                  ),
        ),
        SizedBox(height: LayoutConstants.dimen_6.h),
        Text(
          userEntity.inviteCode,
          style: Theme.of(context)
              .extension<CustomTextTheme>()!
              .heading2B!
              .copyWith(
                fontSize: LayoutConstants.dimen_34.sp,
                fontFamily: AppTextTheme.barlowCondensed,
              ),
        ),
        SizedBox(height: LayoutConstants.dimen_12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () async {
                  await FlutterClipboard.copy(userEntity.inviteCode);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Copied to clipboard"),
                  ));
                },
                child: textWithIconWidget(
                    HomeConstants.copyToClipboard, Icons.copy)),
            // textWithIconWidget(HomeConstants.share, Icons.share),
          ],
        ),
      ],
    );
  }

  Widget textWithIconWidget(String text, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context)
              .extension<CustomColorTheme>()!
              .primaryButtonColor,
        ),
        SizedBox(width: LayoutConstants.dimen_6.h),
        Text(
          text,
          style: Theme.of(context)
              .extension<CustomTextTheme>()!
              .bodyLM!
              .copyWith(
                  color: Theme.of(context)
                      .extension<CustomColorTheme>()!
                      .primaryButtonColor),
        ),
      ],
    );
  }
}
