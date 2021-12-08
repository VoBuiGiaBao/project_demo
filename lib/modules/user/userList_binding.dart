import 'package:get/get.dart';

import 'userList_viewmodel.dart';

class UserListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserListViewModel());
  }
}
