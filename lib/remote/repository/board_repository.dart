//import 'package:board/domain/model/post.dart';

//import '../model/post.dart';

import 'package:reformpro/model/post.dart';

abstract class BoardRepository {
  Future<List<Post>> getPosts();

  Future add(String content);

  Future update(int id, String content);

  Future remove(int id);
}
