import 'dart:async';
import '../models/user.dart';
import '../services/user_service.dart';

class UserViewModel {
  final String content;
  final UserService _userService = UserService();
  final StreamController<User> _userController = StreamController<User>();

  Stream<User> get userStream => _userController.stream;

  UserViewModel({required this.content}) {
    //ViewModel 创建时，从后端获取数据。
    loadUserData();
  }

  Future<void> loadUserData() async {
    try {
      User user = await _userService.fetchUserData()
        ..name = content;
      _userController.add(user);
    } catch (e) {
      _userController.addError(e);
    }
  }

  // Dispose method: avoid memory leaks
  void dispose() {
    _userController.close();
  }
}
