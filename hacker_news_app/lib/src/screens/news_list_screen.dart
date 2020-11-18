import 'package:flutter/material.dart';
import 'package:hacker_news_app/src/blocs/stories_provider.dart';

class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News!'),
      ),
      body: newsListWidget(),
    );
  }

  Widget newsListWidget() {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, index) {
        return FutureBuilder(
          future: fetchNews(),
          builder: (context, snapshot) {
            return snapshot.hasData ? Text("I m visible $index") : Text("I am loading $index");
          },
        );
      },
    );
  }

  Future fetchNews() async {
    return Future.delayed(Duration(seconds: 2), () => 'HelloFlutter');
  }
}
