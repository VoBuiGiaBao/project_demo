import 'package:aina_assignment/modules/user/userProfile_viewmodel.dart';
import 'package:get/get.dart';

class UserProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProfileViewModel>(() => UserProfileViewModel(
        userID: Get.arguments[UserProfileViewModel.PARAM_USER_ID]));
  }
}
