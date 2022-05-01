import 'package:rxdart/rxdart.dart';
import 'api.dart';

class GetBloagDetailsRX {
  final api = GetBlogDetailsApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getBlogDetailsData => _dataFetcher.stream;

  Future<void> fetchBlogDetailsData(String id) async {
    try {
      Map blogDetailsData = await api.fetchBlogDetailsData(id);
      _dataFetcher.sink.add(blogDetailsData);
    } catch (e) {
      _dataFetcher.sink.addError(e);
    }
  }

  void clean() {
    _dataFetcher.sink.add(empty);
  }

  void dispose() {
    _dataFetcher.close();
  }
}
