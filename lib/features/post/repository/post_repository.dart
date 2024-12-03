import 'package:bloc_example/features/post/models/post_model.dart';
import 'package:dio/dio.dart';


class PostRepository {
  final Dio _dio = Dio();

  Future<List<PostModel>> fetchUsers() async {
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/comments');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((e) => PostModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Failed to load data');
    }
  }
}
