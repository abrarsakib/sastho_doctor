import 'package:rxdart/rxdart.dart';
import 'api.dart';

class GetFaqRX {
  final api = GetFaqApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getFaqData => _dataFetcher.stream;

  Future<void> fetchFaqData() async {
    try {
      Map faqData = await api.fetchFaqData();
      _dataFetcher.sink.add(faqData);
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
