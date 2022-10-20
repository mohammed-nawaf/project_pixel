import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pixel/data/url.dart';
import 'package:pixel/models/comments_model/comments_model.dart';
import 'package:pixel/models/posts_model/posts_model.dart';
import 'package:pixel/models/user_model/user_model.dart';

abstract class ApiServices {
  Future<PostsModel> getAllPosts();
  Future<CommentsModel> getComments();
  Future<UserModel> getUser();
}

class ApiCalls extends ApiServices {
  // singleton
  ApiCalls._internal();
  static final instance = ApiCalls._internal();

  factory ApiCalls() {
    return instance;
  }
  // singleton

  // static Map<String, String> headers = {
  //   'app-id': '63414abfda60e103738bae78',
  //   'content-Type': 'application/json'
  // };

  final Dio dio = Dio();
  final Url url = Url();

  @override
  Future<PostsModel> getAllPosts() async {
    PostsModel postsModel = PostsModel();

    // final response = await http.get(
    //     Uri.parse('https://dummyapi.io/data/v1/post?limit=10'),
    //     headers: headers);

    final response = await dio.get(url.baseUrl + url.getPosts,
        options: Options(
          responseType: ResponseType.plain,
          headers: {
            'app-id': '63414abfda60e103738bae78',
            'content-Type': 'application/json'
          },
        ));

    final responseAsJson = json.decode(response.data);
    postsModel = PostsModel.fromJson(responseAsJson);

    return postsModel;
  }

  @override
  Future<CommentsModel> getComments() async {
    CommentsModel commentsModel = CommentsModel();
    final response = await dio.get(url.baseUrl + url.getComments,
        options: Options(responseType: ResponseType.plain, headers: {
          'app-id': '63414abfda60e103738bae78',
          'content-Type': 'application/json'
        }));

    final responseAsJson = json.decode(response.data);
    commentsModel = CommentsModel.fromJson(responseAsJson);
    return commentsModel;
  }

  @override
  Future<UserModel> getUser() async {
    UserModel userModel = UserModel();
    final response = await dio.get(url.baseUrl + url.getUser,
        options: Options(responseType: ResponseType.plain, headers: {
          'app-id': '63414abfda60e103738bae78',
          'content-Type': 'application/json'
        }));

    if (response.statusCode == 200) {
      final responseAsJson = json.decode(response.data);
      userModel = UserModel.fromJson(responseAsJson);
      return userModel;
    } else {
      throw Error();
    }
  }
}
