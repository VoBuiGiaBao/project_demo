import 'package:aina_assignment/modules/user/userProfile_binding.dart';
import 'package:aina_assignment/modules/user/userList_binding.dart';
import 'package:aina_assignment/modules/user/userList_view.dart';
import 'package:aina_assignment/modules/user/userProfile_view.dart';
import 'package:aina_assignment/routes/routes.dart';
import 'package:get/route_manager.dart';

class Pages {
  static List<GetPage> pages() {
    return [
      GetPage(
        name: Routes.user_list,
        page: () => UserListView(),
        binding: UserListBinding(),
      ),
      GetPage(
        name: Routes.user_profile,
        page: () => UserProfileView(),
        binding: UserProfileBinding(),
      )
    ];
  }
}
