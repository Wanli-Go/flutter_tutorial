import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:flutter/foundation.dart';
import '../models/user.dart';

class UserService {
  Future<User> fetchUserData() async {
    try{
      var response = await http.get(Uri.parse('https://your-api-url.com-hhhh/user'));
      var jsonData = json.decode(response.body);
      return User.fromJson(jsonData);
    }catch(e){
      // 一定会出错，因此返回假数据
      await Future.delayed(Duration(seconds: 2)); //假设这是和服务器交互的时间
      return User(id: '1', name: 'John Doe', email: 'john.doe@example.com');
    }
  }
}
