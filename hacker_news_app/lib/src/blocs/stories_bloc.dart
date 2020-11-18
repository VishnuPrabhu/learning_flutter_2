import 'package:rxdart/rxdart.dart';

import '../resources/repository.dart';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();

  Stream get topIds => _topIds.stream;

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  void dispose() {
    _topIds.close();
  }
}
