import 'package:facebook/config/palette.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectIndex;
  final Function(int) onPressed;

  const CustomNavBar(
      {super.key,
      required this.icons,
      required this.selectIndex,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.zero,
      indicator: const BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Palette.facebookBlue,
        width: 3.0,
      ))),
      tabs: icons.map((e) => Icon(e)).toList(),
      onTap: onPressed,
    );
  }
}
