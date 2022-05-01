import 'package:rxdart/rxdart.dart';
import 'api.dart';

class GetTermsandConditionRX {
  final api = GetTermsandConditionApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getTermsandConditionData => _dataFetcher.stream;

  Future<void> fetchTermsandConditionData() async {
    try {
      Map termsAndConditionData = await api.fetchTermsandConditionData();
      _dataFetcher.sink.add(termsAndConditionData);
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
