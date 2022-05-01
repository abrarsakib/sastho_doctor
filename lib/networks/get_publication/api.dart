import 'dart:convert';

import '../../helpers/dio/dio.dart';
import '../endpoints.dart';

class GetPublicationApi {
  Future<Map> fetchPublicationData() async {
    final _response = await getHttpNoAuth(
      Endpoints.getPublication(),
    );

    if (_response.statusCode == 200) {
      Map data = json.decode(json.encode(_response.data));
      return data;
    }
    // print(_response.toString);
    Map empty = {};
    return empty;
  }
}
