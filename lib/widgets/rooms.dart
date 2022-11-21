import 'package:facebook/config/palette.dart';
import 'package:facebook/models/user_model.dart';
import 'package:facebook/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUser;

  const Rooms({super.key, required this.onlineUser});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.0),
            scrollDirection: Axis.horizontal,
            itemCount: 1 + onlineUser.length,
            itemBuilder: (BuildContext context, index) {
              if (index == 0) {
                return _CreateRoomButton();
              }
              final User user = onlineUser[index - 1];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ProfileAvatar(
                  imageUrl: user.imageUrl,
                  isActive: true,
                ),
              );
            }));
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (() => print("Create Room")),
      style: OutlinedButton.styleFrom(
        foregroundColor: Palette.facebookBlue,
        side: BorderSide(color: Colors.blueAccent[100]!, width: 3.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (bounds) =>
                Palette.createRoomGradient.createShader(bounds),
            child: Icon(
              Icons.video_call,
              color: Colors.white,
              size: 35.0,
            ),
          ),
          const SizedBox(width: 4.0),
          const Text("Create\nRoom"),
        ],
      ),
    );
  }
}
