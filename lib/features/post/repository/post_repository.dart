import 'package:bloc_example/features/post/models/post_model.dart';
import 'package:dio/dio.dart';

class PostRepository {
  final Dio _dio = Dio();

  Future<List<PostModel>> fetchUsers({
    int page = 1,
    int limit = 10,
    String? searchQuery,
  }) async {
    try {
      final queryParams = <String, String>{
        '_page': page.toString(),
        '_limit': limit.toString(),
      };

      if (searchQuery != null && searchQuery.isNotEmpty) {
        // Add search filter to query parameters
        queryParams['q'] = searchQuery;
      }

      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/comments',
        queryParameters: queryParams,
      );
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
