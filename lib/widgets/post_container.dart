import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/config/palette.dart';
import 'package:facebook/models/post_model.dart';
import 'package:facebook/widgets/profileavator.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                const SizedBox(
                  height: 5.0,
                ),
                Text(post.caption),
                post.imageUrl != ""
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 6.0,
                      ),
              ],
            ),
          ),
          post.imageUrl != ""
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post: post),
          )
        ],
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

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                "${post.likes}",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              "${post.comments} Comments",
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              "${post.shares} Shares",
              style: TextStyle(color: Colors.grey[600]),
            )
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                label: "Like",
                onpressed: (() => print("Like"))),
            _PostButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                label: "Comment",
                onpressed: (() => print("Comment"))),
            _PostButton(
                icon: Icon(
                  MdiIcons.share,
                  color: Colors.grey[600],
                  size: 25.0,
                ),
                label: "Share",
                onpressed: (() => print("Share"))),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onpressed;

  const _PostButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
      color: Colors.white,
      child: InkWell(
        onTap: onpressed,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          height: 25.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 4.0,
              ),
              Text(label)
            ],
          ),
        ),
      ),
    ));
  }
}
