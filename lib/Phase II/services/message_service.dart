import 'package:flutter_app/Phase II/models/backend_message.dart';
import 'package:flutter_app/Phase II/models/response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BackendMessageService {
  
  Future<Response> sendMessageToBackend(BackendMessage message) async {
    // API endpoint URL
    const apiUrl = 'https://your-backend-api-url-hhh.com/';

    // 创建一个保存信息的map，名字要和API对应。这个逻辑在model层实现。
    final messageData = message.toJSON();

    // 把map信息加密成JSON字符串
    final jsonMessage = jsonEncode(messageData);

    try {
      // 对后端做POST请求，格式如下
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonMessage,
      );

      // status code 200)
      if (response.statusCode == 200) {
        // 把结果转换为一个map
        final responseData = jsonDecode(response.body);
        return Response.fromJSON(responseData);
      } else {
        // 其它状态
        print('Failed to send message. Status code: ${response.statusCode}');
        throw Exception('Failed to send data to the backend');
      }
    } catch (e) {
      // 处理其他异常。因为这里的假API一定无法访问，因此我们创建如下假数据：
      await Future.delayed(Duration(seconds: 2)); //假设这是和服务器交互的时间
      return Response.fromJSON({'type': 1, 'content': message.message, 'uselessContent': "I'm useless!"});
    }
  }
}
