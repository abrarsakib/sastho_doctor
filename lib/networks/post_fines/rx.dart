import 'dart:io';

import 'package:contesta_na_hora/helpers/navigation_service.dart';
import 'package:contesta_na_hora/widgets/loading_indicators.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'api.dart';

class PostFileRX {
  final api = PostFineApi();
  Map empty = {};
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getFileData => _dataFetcher.stream;

  Future<void> postFileData(
    String? billtype,
    String? name,
    String? email,
    String? phone,
    String? message,
    List<File>? document,
  ) async {
    try {
      showDialog(
        context: NavigationService.context,
        builder: (context) => loadingIndicatorCircle(context: context),
      );
      Map fileData = await api.postFineData(
          billtype, name, email, phone, message, document);
      NavigationService.goBack;
      _dataFetcher.sink.add(fileData);
    } catch (e) {
      _dataFetcher.sink.addError(e);
      // NavigationService.goBack;
    }
  }

  void clean() {
    _dataFetcher.sink.add(empty);
  }

  void dispose() {
    _dataFetcher.close();
  }
}
