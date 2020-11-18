import 'package:flutter/material.dart';

import 'blocs/stories_provider.dart';
import 'screens/news_list_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News!',
        home: NewsListScreen(),
      ),
    );
  }
}
