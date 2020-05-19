import 'package:flutter/material.dart';

import '../model/image_model.dart';

class ImagesListView extends StatelessWidget {
  final List<ImageModel> images;

  ImagesListView(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return _buildImage(images[index]);
      },
    );
  }

  Widget _buildImage(ImageModel image) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Image.network(image.url),
          ),
          Text(
            image.title,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
