import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:post_app/core/Errors/exceptions.dart';
import 'package:post_app/features/post/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> addPost(PostModel postModel);
  Future<Unit> updatePost(PostModel postModel);
  Future<Unit> deletePost(int postId);
}

final BASE_URL = 'https://jsonplaceholder.typicode.com/posts';

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(Uri.parse(BASE_URL),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;
      List<PostModel> postModels =
          decodeJson.map((json) => PostModel.fromJson(json)).toList();

      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost(PostModel postModel) async {
    final body = {'title': postModel.title, 'body': postModel.body};

    final response = await client.post(Uri.parse(BASE_URL), body: body);

    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(int postId) async {
    final response = await client.delete(
      Uri.parse(BASE_URL + '/${postId.toString()}'),
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel postModel) async {
    final body = {
      'id': postModel.id,
      'title': postModel.title,
      'body': postModel.body
    };

    final response =
        await client.put(Uri.parse(BASE_URL + '/${postModel.id}'), body: body);

    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
