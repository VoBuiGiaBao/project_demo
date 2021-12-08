import 'package:aina_assignment/modules/user/userProfile_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileView extends GetView<UserProfileViewModel> {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<UserProfileViewModel>(
      builder: (viewmodel) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text("Profile", style: TextStyle(fontSize: 28)),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: viewmodel.fetchUserDetail,
          child: ListView(
            padding: const EdgeInsets.all(.0),
            children: [
              _header(context, viewmodel.user.avatarUrl),
              Center(
                child: Text(
                  "${viewmodel.user.name}",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ),
              Center(child: Text("${viewmodel.user.location}")),
              Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "${viewmodel.user.followers}",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w500),
                        ),
                        Text("Followers"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "${viewmodel.user.following}",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w500),
                        ),
                        Text("Following"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "${viewmodel.user.publicRepos}",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w500),
                        ),
                        Text("Repos"),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20),
              SizedBox(
                width: width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bio",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      Text("${viewmodel.user.bio}"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(context, avatarUrl) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final bgHeight = height * 0.4;
    return SizedBox(
      height: bgHeight + 40,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "https://source.unsplash.com/user/erondu/480x360",
            imageBuilder: (context, imageProvider) => Container(
              height: bgHeight,
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Positioned(
            top: bgHeight - 90,
            left: width * 0.5 - 60,
            child: ClipOval(
              child: SizedBox(
                width: 120,
                height: 120,
                child: avatarUrl.isEmpty
                    ? Image.asset(
                        "assets/png/ic_avatar_default.png",
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl: avatarUrl,
                        errorWidget: (c, s, d) => Image.asset(
                          "assets/png/ic_avatar_default.png",
                          fit: BoxFit.cover,
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
