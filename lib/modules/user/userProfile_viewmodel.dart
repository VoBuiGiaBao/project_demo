import 'package:aina_assignment/data/local/userDao.dart';
import 'package:aina_assignment/models/user_model.dart';
import 'package:aina_assignment/data/services/user_service.dart';
import 'package:get/get.dart';

class UserProfileViewModel extends GetxController {
  UserServices _userServices = UserServices();
  static const String PARAM_USER_ID = "user_id";
  late int userID;
  late User user;

  UserProfileViewModel({required this.userID});

  @override
  void onInit() async {
    super.onInit();
    user = await UserDao.getById(userID);
    update();
    fetchUserDetail();
  }

  Future<void> fetchUserDetail() async {
    await _userServices.fetchUserDetail(userID).then((_res) async {
      user = User.fromJson(_res);
      await UserDao.updateProfile(user);
      update();
    });
  }
}
