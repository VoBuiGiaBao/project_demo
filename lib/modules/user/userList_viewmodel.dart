import 'package:aina_assignment/data/local/userDao.dart';
import 'package:aina_assignment/models/user_model.dart';
import 'package:aina_assignment/data/services/user_service.dart';
import 'package:get/get.dart';

class UserListViewModel extends GetxController {
  UserServices _userServices = UserServices();
  List<User> userList = [];

  @override
  void onInit() async {
    super.onInit();
    userList = await UserDao.getAll();
    update();
    fetchUserList();
  }

  Future<void> fetchUserList() async {
    await _userServices.fetchUserList().then((_res) {
      // assign userList from api service
      userList = User.fromList(_res);
      // cache userList
      if (userList.length > 0)
        userList.forEach((_user) async {
          if (await UserDao.checkUserById(_user.id))
            await UserDao.update(_user);
          else
            await UserDao.insert(_user);
        });
      update();
    });
  }
}
