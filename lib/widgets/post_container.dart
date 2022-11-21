import 'package:facebook/models/post_model.dart';
import 'package:facebook/widgets/profileavator.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_PostHeader(post: post)],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${post.timeAgo} • ",
                    style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
                  ),
                  Icon(
                    Icons.public,
                    size: 12.0,
                    color: Colors.grey[600],
                  )
                ],
              ),
            ],
          ),
        ),
        TextButton(
            onPressed: (() => print("more")),
            child: const Icon(
              Icons.more_horiz,
              color: Colors.black,
            ))
      ],
    );
  }
}
