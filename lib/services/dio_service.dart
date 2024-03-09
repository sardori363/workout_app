import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/models/post_model.dart';

class NetworkService {
  /// Base Url */
  static bool isTester = true;

  static String DEVELOPMENT = "https://65a77f0b94c2c5762da6cd3a.mockapi.io";
  static String DEPLOYMENT = "https://65a77f0b94c2c5762da6cd3a.mockapi.io";

  static String get baseApiUrl {
    if (isTester) return DEVELOPMENT;
    return DEPLOYMENT;
  }

  /// Apis
  static const String apiGetAllPosts = "/product";

  /// Headers
  static Map<String, String> get headers => const <String, String>{
        'Content-Type': 'application/json',
      };

  /// BaseOptions */
  static final BaseOptions _baseDioOptions = BaseOptions(
    baseUrl: baseApiUrl,
    headers: headers,
    connectTimeout: const Duration(seconds: 4000),
    receiveTimeout: const Duration(seconds: 4000),
    contentType: 'application/json',
    responseType: ResponseType.json,
  );

  static final Dio _dio = Dio(_baseDioOptions);

  /// Methods
  static Future<List<dynamic>?> getData(
      String api, Map<String, dynamic> param) async {
    Response response = await _dio.get(api, queryParameters: param);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      return null;
    }
  }

  static Future<List<dynamic>?> postData(BuildContext context,
      Map<String, dynamic> data, String api, Map<String, dynamic> param) async {
    try {
      log("api $baseApiUrl$api");
      Response response = await _dio.post(api, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      Future.delayed(Duration.zero).then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
      log(e.message.toString());
      return null;
    }
  }

  /// Params
  static Map<String, dynamic> paramEmpty() => const <String, dynamic>{};
  static Map<String, dynamic> paramBeginnerCat() => const <String, dynamic>{
        'category': 'Beginner',
      };

  static Map<String, dynamic> paramInterCat() => const <String, dynamic>{
        'category': 'Intermediate',
      };

  static Map<String, dynamic> paramAdvancedCat() => const <String, dynamic>{
        'category': 'Advanced',
      };

  /// Parsing
  static List<Post> parsePostList(List json) {
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }
}
