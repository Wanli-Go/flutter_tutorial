import 'package:flutter_app/Phase II/models/response.dart';
import 'package:flutter_app/Phase II/view_models/main_page_model.dart';
import 'package:flutter/material.dart';
import 'user_page.dart';

// 定义 ViewModel
final MainPageModel _model = MainPageModel();

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false; // 判断是否在等待后端返回数据

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator() // 如果isLoading, 显示加载图标
            : TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Enter something',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: _sendMessageAndNavigate,
              ),
      ),
    );
  }

  void _sendMessageAndNavigate(String value) async {
    setState(() {
      _isLoading = true; // 开始加载
    });

    
    // 同步等待结果
    Response response = await _model.sendMessage(value);

    setState(() {
      _isLoading = false; // 加载结束
    });

    // 切换到下一个界面的之前，显示一个提示框
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Message Sent'),
        content: Text('Response: ${response.content}'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => UserPage(response: response.content), // 将数据传递给下一个页面
              ));
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
    
  }

}
