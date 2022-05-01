import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../helpers/dio/dio.dart';
import '../endpoints.dart';

class GetBlogHeaderApi {
  Future<Map> fetchBlogHeaderData() async {
    final _response = await getHttpNoAuth(
      Endpoints.getBlogHeader(),
    );

    if (_response.statusCode == 200) {
      Map data = json.decode(json.encode(_response.data));
      return data;
    }
    if (kDebugMode) {
      print(_response.toString);
    }
    Map empty = {};
    return empty;
  }
}
