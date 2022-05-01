import 'package:rxdart/rxdart.dart';
import 'api.dart';

class GetPublicationRX {
  final api = GetPublicationApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getPublicationData => _dataFetcher.stream;

  Future<void> fetchPublicationData() async {
    try {
      Map publicationData = await api.fetchPublicationData();
      _dataFetcher.sink.add(publicationData);
    } catch (e) {
      // print(e);
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
