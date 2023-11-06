class Response {
  final int type;
  final String content;

  Response({
    required this.type,
    required this.content,
  });

  // fromJSON method to create a Response object from a Map
  // 只需要从中取出 需要的 参数
  factory Response.fromJSON(Map<String, dynamic> json) {
    return Response(
      type: json['type'] as int,
      content: json['content'] as String,
    );
  }

  // toString method to convert a Response object to a String
  @override
  String toString() {
    return 'Response(type: $type, content: $content)';
  }
}
