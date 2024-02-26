import 'package:chatify/common/theme/new_theme/color_theme/custom_color_theme_extension.dart';
import 'package:flutter/material.dart';

class PopButton extends StatefulWidget {
  final double? size;
  const PopButton({super.key, this.size});

  @override
  State<PopButton> createState() => _PopButtonState();
}

class _PopButtonState extends State<PopButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          size: widget.size,
          Icons.arrow_back,
          color: Theme.of(context).extension<CustomColorTheme>()!.icon1,
        ),
      ),
    );
  }
}
