class UrlConst {
  static final UrlConst shared = UrlConst._();
  UrlConst._();

  String get baseUrl => 'https://jsonplaceholder.typicode.com';
  String get posts => '$baseUrl/posts';
  String comments(int postId) => '$baseUrl/posts/$postId/comments';
  String userImge(String name) => 'https://ui-avatars.com/api/?name=$name';
}
