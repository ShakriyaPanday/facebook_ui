import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectIndex;
  final Function onPressed;

  const CustomNavBar(
      {super.key,
      required this.icons,
      required this.selectIndex,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
