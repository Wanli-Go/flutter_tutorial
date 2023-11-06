class BackendMessage {
  final String message;

  BackendMessage({required this.message});

  Map<String, dynamic> toJSON() {
    return {
      'message': message,
    };
  }

  @override
  String toString() {
    return 'BackendMessage{ message: $message }';
  }
}
