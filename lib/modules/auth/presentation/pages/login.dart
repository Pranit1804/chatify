import 'package:chatify/common/constants/layout_constants.dart';
import 'package:chatify/common/extensions/screen_utils_extensions.dart';
import 'package:chatify/common/theme/new_theme/color_theme/custom_color_theme_extension.dart';
import 'package:chatify/common/theme/new_theme/color_theme/default_color_themes.dart';
import 'package:chatify/common/theme/new_theme/text_theme/custom_text_theme_extension.dart';
import 'package:chatify/modules/auth/auth_constants.dart';
import 'package:chatify/widgets/common_text_field.dart';
import 'package:chatify/widgets/pop_button.dart';
import 'package:chatify/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomColorTheme>()!.homeBackground!,
      body: Container(
        padding: EdgeInsets.all(LayoutConstants.dimen_16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const PopButton(),
            SizedBox(height: LayoutConstants.dimen_42.h),
            _titleAndDesc(),
            SizedBox(height: LayoutConstants.dimen_72.h),
            _loginForm(),
            const Spacer(),
            if (errorText.isNotEmpty)
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                  left: LayoutConstants.dimen_6.h,
                  bottom: LayoutConstants.dimen_12.h,
                ),
                child: Text(
                  errorText,
                  style: Theme.of(context)
                      .extension<CustomTextTheme>()!
                      .bodyMR!
                      .copyWith(color: Colors.red),
                ),
              ),
            PrimaryButton(
              text: AuthConstants.login,
              onTap: onCreateTapped,
              textStyle: Theme.of(context)
                  .extension<CustomTextTheme>()!
                  .bodyMB!
                  .copyWith(
                    color: Theme.of(context)
                        .extension<CustomColorTheme>()!
                        .reverseTextColor,
                  ),
            ),
            SizedBox(height: LayoutConstants.dimen_30.h),
          ],
        ),
      ),
    );
  }

  void onCreateTapped() {
    if (_validateAllFields()) {
    } else {
      setState(() {
        errorText = 'Please Enter All Fields';
      });
    }
  }

  Widget _titleAndDesc() {
    return Column(
      children: [
        Text(
          AuthConstants.loginChatify,
          style: Theme.of(context)
              .extension<CustomTextTheme>()!
              .displaySSB!
              .copyWith(fontStyle: FontStyle.normal),
        ),
        SizedBox(height: LayoutConstants.dimen_12.h),
        Text(
          AuthConstants.loginDesc,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .extension<CustomTextTheme>()!
              .displayXSSB!
              .copyWith(
                fontStyle: FontStyle.normal,
                color: AppColor.lightGreyColor2,
              ),
        ),
      ],
    );
  }

  bool _validateAllFields() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Widget _loginForm() {
    return Column(
      children: [
        CustomTextField(
          hintText: AuthConstants.yourEmail,
          textController: _emailTextController,
        ),
        SizedBox(height: LayoutConstants.dimen_30.h),
        CustomTextField(
          hintText: AuthConstants.password,
          textController: _passwordTextController,
        ),
      ],
    );
  }
}
