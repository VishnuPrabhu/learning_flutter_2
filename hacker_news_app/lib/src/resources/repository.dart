import 'package:hacker_news_app/src/models/item_model.dart';
import 'package:hacker_news_app/src/resources/news_api_provider.dart';

import 'news_db_provider.dart';

class Repository {
  final dbProvider = NewsDbProvider();
  final apiProvider = NewsApiProvider();

  Repository() {
    dbProvider.init();
  }

  Future<List<int>> fetchTopIds() {
    return apiProvider.fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    var item = await dbProvider.fetchItem(id);
    if (item != null) {
      return item;
    }
    item = await apiProvider.fetchItem(id);
    dbProvider.addItem(item);

    return item;
  }
}
