import 'package:rxdart/rxdart.dart';
import 'api.dart';

class GetProfileRX {
  final api = GetProfileApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getProfileData => _dataFetcher.stream;

  Future<void> fetchProfileData() async {
    try {
      Map profileData = await api.fetchProfileData();
      _dataFetcher.sink.add(profileData);
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
