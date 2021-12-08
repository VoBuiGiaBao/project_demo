import 'package:aina_assignment/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.user,
    required this.onPressed,
  }) : super(key: key);

  final User user;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  ClipOval(
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: user.avatarUrl.isEmpty
                          ? Image.asset(
                              "assets/png/ic_avatar_default.png",
                              fit: BoxFit.cover,
                            )
                          : CachedNetworkImage(
                              imageUrl: user.avatarUrl,
                              errorWidget: (c, s, d) => Image.asset(
                                "assets/png/ic_avatar_default.png",
                                fit: BoxFit.cover,
                              ),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                            ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.login,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        user.htmlUrl,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
