import 'package:facebook/screen/home_screen.dart';
import 'package:facebook/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(
      body: Text("Video"),
    ),
    Scaffold(
      body: Text("account"),
    ),
    Scaffold(
      body: Text("group"),
    ),
    Scaffold(
      body: Text("notification"),
    ),
    Scaffold(
      body: Text("menu"),
    ),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];
  int _selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
            bottomNavigationBar: CustomNavBar(
                icons: _icons,
                selectIndex: _selectIndex,
                onPressed: ((index) => setState(() => _selectIndex = index))),
            body: IndexedStack(
              index: _selectIndex,
              children: _screens,
            )));
  }
}
