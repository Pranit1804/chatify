import 'dart:ui' as ui;

import 'package:chatify/common/constants/layout_constants.dart';
import 'package:chatify/common/constants/svg_constants.dart';
import 'package:chatify/common/extensions/screen_utils_extensions.dart';
import 'package:chatify/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:chatify/common/theme/new_theme/text_theme/custom_text_theme_extension.dart';
import 'package:chatify/modules/launch/launch_constants.dart';
import 'package:chatify/routes/routes_constant.dart';
import 'package:chatify/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: [
            // _background(),

            Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: LayoutConstants.dimen_24.h,
                horizontal: LayoutConstants.dimen_24.h,
              ),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(SvgConstants.chatifyLogoWithText),
                  SizedBox(height: LayoutConstants.dimen_42.h),
                  mainHeader(),
                  SizedBox(height: LayoutConstants.dimen_12.h),
                  appDescription(),
                  const Spacer(),
                  signUpCTA(),
                  SizedBox(height: LayoutConstants.dimen_16.h),
                  loginCTA(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appDescription() {
    return Text(
      LaunchConstants.launchDescription,
      style: Theme.of(context).extension<CustomTextTheme>()!.bodyLM!.copyWith(
            color: AppColor.lightGreyColor,
          ),
    );
  }

  Widget loginCTA() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesConstants.login);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '${LaunchConstants.existingAccount} \t',
              style: Theme.of(context)
                  .extension<CustomTextTheme>()!
                  .bodyMB!
                  .copyWith(color: AppColor.lightGreyColor),
            ),
            TextSpan(
              text: LaunchConstants.logIn,
              style: Theme.of(context)
                  .extension<CustomTextTheme>()!
                  .bodyMM!
                  .copyWith(color: AppColor.lightGreyColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget signUpCTA() {
    return PrimaryButton(
      backgroundColor: Colors.white,
      onTap: () {
        Navigator.pushNamed(context, RoutesConstants.signUp);
      },
      text: LaunchConstants.signUpWithMail,
      textStyle: Theme.of(context)
          .extension<CustomTextTheme>()!
          .bodyMM!
          .copyWith(color: AppColor.ravenText),
    );
  }

  Widget mainHeader() {
    return Column(
      children: [
        Text(
          LaunchConstants.connectFriends,
          style: Theme.of(context)
              .extension<CustomTextTheme>()!
              .displayLabel!
              .copyWith(
                color: AppColor.snowDriftText,
                fontSize: LayoutConstants.dimen_68.h,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
        ),
        Text(
          LaunchConstants.easilyAndQuickly,
          style: Theme.of(context)
              .extension<CustomTextTheme>()!
              .displayLabel!
              .copyWith(
                color: AppColor.snowDriftText,
                fontSize: LayoutConstants.dimen_68.h,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              ),
        ),
      ],
    );
  }

  Widget _background() {
    return Container(
      height: double.infinity,
      child: Stack(
        children: [
          SvgPicture.asset(
            SvgConstants.onboardingBG,
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 40.0,
              sigmaY: 40.0,
            ),
            child: Container(
              height: double.infinity,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
