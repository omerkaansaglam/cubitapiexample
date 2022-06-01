import 'dart:convert';

import 'package:cubitapiexample/features/home/model/home_model.dart';
import 'package:http/http.dart' as http;

abstract class IHomeService {
  Future<List<HomeModel>> getPosts();
}

class HomeService extends IHomeService {
  final String _baseUrl = "https://jsonplaceholder.typicode.com/posts";

  @override
  Future<List<HomeModel>> getPosts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body
          .map(
            (dynamic item) => HomeModel.fromJson(item),
          )
          .toList();
    } else {
      throw "Error data not found";
    }
  }
}
