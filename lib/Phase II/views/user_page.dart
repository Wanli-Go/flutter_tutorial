import 'package:flutter/material.dart';
import '../view_models/user_view_model.dart';
import '../models/user.dart'; // Reference to your User model.

class UserPage extends StatefulWidget {
  final String response;

  const UserPage({super.key, required this.response});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late UserViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = UserViewModel(content: widget.response); // 新建一个ViewModel
  }

  @override
  void dispose() {
    _viewModel.dispose(); // Dispose the ViewModel to close the stream
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page for ${widget.response}'),
      ),
      body: StreamBuilder<User>(
        stream: _viewModel.userStream, // Listen directly to the ViewModel's stream
        builder: (context, snapshot) {
          // Checking connection state first
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No user data available.'));
          } else {
            // Once the data is available, it can be displayed.
            User user = snapshot.data!;
            return Center(child: Text('User Data: ${user.toString()}'));
          }
        },
      ),
    );
  }
}

