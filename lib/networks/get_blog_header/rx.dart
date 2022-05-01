import 'package:rxdart/rxdart.dart';
import 'api.dart';

class GetBloagHeaderRX {
  final api = GetBlogHeaderApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getBlogHeaderData => _dataFetcher.stream;

  Future<void> fetchBlogData() async {
    try {
      Map blogHeaderData = await api.fetchBlogHeaderData();
      _dataFetcher.sink.add(blogHeaderData);
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
