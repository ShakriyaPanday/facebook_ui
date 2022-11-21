import 'package:facebook/models/story_model.dart';
import 'package:facebook/models/user_model.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({super.key, required this.currentUser, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      height: 200.0,
      color: Colors.deepOrange[300],
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _storyCard(
                  isAddStory: true,
                  currentUser: currentUser,
                  story: stories[0]),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _storyCard(currentUser: currentUser, story: story),
          );
        },
      ),
    );
  }
}

class _storyCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  const _storyCard(
      {super.key,
      this.isAddStory = false,
      required this.currentUser,
      required this.story});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
