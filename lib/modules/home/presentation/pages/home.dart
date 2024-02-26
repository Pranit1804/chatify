import 'package:chatify/common/constants/app_constants.dart';
import 'package:chatify/common/constants/layout_constants.dart';
import 'package:chatify/common/extensions/screen_utils_extensions.dart';
import 'package:chatify/common/theme/new_theme/color_theme/custom_color_theme_extension.dart';
import 'package:chatify/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:chatify/common/theme/new_theme/text_theme/custom_text_theme_extension.dart';
import 'package:chatify/di/injector.dart';
import 'package:chatify/modules/app.dart';
import 'package:chatify/modules/auth/bloc/auth_bloc.dart';
import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:chatify/modules/home/bloc/home_bloc.dart';
import 'package:chatify/modules/home/home_constants.dart';
import 'package:chatify/routes/routes_constant.dart';
import 'package:chatify/widgets/profile_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<UserEntity> friends = [];
  late HomeBloc _homeBloc;
  late AuthBloc _authBloc;
  final ValueNotifier<bool> _loader = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _homeBloc = Injector.resolve<HomeBloc>();
    _authBloc = Injector.resolve<AuthBloc>();
    _homeBloc.add(GetAllFriendsEvent());
  }

  _listenToHomeBloc(BuildContext context, HomeState state) {
    if (state is GetAllFriendsSuccessState) {
      friends = state.friends;
      _loader.value = false;
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
              padding: EdgeInsets.only(
                left: LayoutConstants.dimen_16.h,
                right: LayoutConstants.dimen_16.h,
                top: LayoutConstants.dimen_16.h,
              ),
              child: Column(
                children: [
                  _buildAppbar(),
                  !_loader.value && friends.isNotEmpty
                      ? friendsList()
                      : _loader.value
                          ? const Center(child: CircularProgressIndicator())
                          : _addNewFriendWidget(),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, RoutesConstants.shareInviteScreen);
        },
      ),
    );
  }

  Widget _buildAppbar() {
    return Row(
      children: [
        Text(
          AppConstants.appName,
          style: Theme.of(context)
              .extension<CustomTextTheme>()!
              .displayLSB!
              .copyWith(fontStyle: FontStyle.normal),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            App.mtAppGlobalKey.currentState!.changeThemeMode(
              App.mtAppGlobalKey.currentState!.getThemeMode() == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
            setState(() {});
          },
          child: Icon(
            App.mtAppGlobalKey.currentState!.getThemeMode() == ThemeMode.dark
                ? Icons.light_mode
                : Icons.dark_mode,
          ),
        ),
        SizedBox(width: LayoutConstants.dimen_12.h),
        GestureDetector(
          onTap: () {
            _authBloc.add(LogoutUserEvent());
            Navigator.pushNamedAndRemoveUntil(
                context, RoutesConstants.onboarding, (route) => true);
          },
          child: const Icon(Icons.logout),
        ),
      ],
    );
  }

  Widget friendsList() {
    return Column(
      children: [
        SizedBox(height: LayoutConstants.dimen_10.h),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              friends.length,
              (index) => Column(
                    children: [
                      SizedBox(height: LayoutConstants.dimen_22.h),
                      _singlePersonTile(friends[index]),
                    ],
                  )),
        ),
      ],
    );
  }

  Widget _addNewFriendWidget() {
    return Padding(
      padding: EdgeInsets.only(top: LayoutConstants.dimen_180.h),
      child: Text(
        HomeConstants.clickToAdd,
        style: Theme.of(context)
            .extension<CustomTextTheme>()!
            .displayMSB!
            .copyWith(
                fontStyle: FontStyle.normal, color: AppColor.lightGreyColor2),
      ),
    );
  }

  Widget _singlePersonTile(UserEntity friend) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesConstants.chat,
          arguments: friend,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileIcon(),
          SizedBox(width: LayoutConstants.dimen_10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: LayoutConstants.dimen_5.h),
              Text(
                friend.username,
                style: Theme.of(context).extension<CustomTextTheme>()!.bodyXLM,
              ),
            ],
          )
        ],
      ),
    );
  }
}
