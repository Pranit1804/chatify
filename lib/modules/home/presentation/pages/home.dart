import 'package:chatify/common/constants/layout_constants.dart';
import 'package:chatify/common/extensions/screen_utils_extensions.dart';
import 'package:chatify/common/theme/new_theme/color_theme/custom_color_theme_extension.dart';
import 'package:chatify/common/theme/new_theme/text_theme/custom_text_theme_extension.dart';
import 'package:chatify/di/injector.dart';
import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:chatify/modules/home/bloc/home_bloc.dart';
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
  final ValueNotifier<bool> _loader = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _homeBloc = Injector.resolve<HomeBloc>();
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
            return !_loader.value && friends.isNotEmpty
                ? Container(
                    padding: EdgeInsets.only(
                      left: LayoutConstants.dimen_16.h,
                      right: LayoutConstants.dimen_16.h,
                      top: LayoutConstants.dimen_66.h,
                    ),
                    child: Column(
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
                  )
                : _loader.value
                    ? const Center(child: CircularProgressIndicator())
                    : Container();
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, RoutesConstants.shareInviteScreen);
        },
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
