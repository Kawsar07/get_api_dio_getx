import 'package:dio/dio.dart';

import '../Model/postModel.dart';

class RemoteService {
  Dio _dio = Dio();
  final Dio dio;
  static const String url = "https://jsonplaceholder.typicode.com/posts";

  RemoteService(this.dio);

  Future<List<PostModel>> getAllPost() async {
    List<PostModel> data = [];
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      for (var i = 0; i < response.data.length; i++) {
        data.add(PostModel.fromJson(response.data[i]));
      }
    }
    return data;
  }
}
