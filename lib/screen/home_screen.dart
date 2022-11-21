import 'package:facebook/config/palette.dart';
import 'package:facebook/data/data.dart';
import 'package:facebook/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          floating: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text(
            "facebook",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
              color: Palette.facebookBlue,
            ),
          ),
          actions: [
            CircleButton(
              icon: Icons.search,
              iconsize: 28.0,
              onpressed: (() => print("Search pressed")),
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconsize: 28.0,
              onpressed: (() => print("Messenger pressed")),
            ),
          ],
        ),
        SliverToBoxAdapter(
            child: CreatePostContainer(
          currentUser: currentUser,
        )),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUser: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
              child: Stories(
            currentUser: currentUser,
            stories: stories,
          )),
        ),
        SliverFillRemaining(
          child: Column(
            children: [Text('some cool text here')],
          ),
        )
      ]),
    );
  }
}
