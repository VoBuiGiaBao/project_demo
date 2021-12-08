import 'package:aina_assignment/models/user_model.dart';
import 'package:aina_assignment/modules/user/userList_viewmodel.dart';
import 'package:aina_assignment/modules/user/userProfile_viewmodel.dart';
import 'package:aina_assignment/modules/user/widgets/user_card.dart';
import 'package:aina_assignment/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListView extends GetView<UserListViewModel> {
  const UserListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserListViewModel>(
      builder: (viewmodel) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text("User List",
              style: TextStyle(color: Colors.black, fontSize: 28)),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: viewmodel.fetchUserList,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: viewmodel.userList.length,
                itemBuilder: (context, index) {
                  User _user = viewmodel.userList[index];
                  return UserCard(
                      user: _user,
                      onPressed: () =>
                          Get.toNamed(Routes.user_profile, arguments: {
                            UserProfileViewModel.PARAM_USER_ID: _user.id,
                          }));
                }),
          ),
        ),
      ),
    );
  }
}
