import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> imgs;

  ImageList(this.imgs);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: imgs.length,
      itemBuilder: (context, int index) {
        return buildImage(imgs[index]);
      },
    );
  }

  Widget buildImage(ImageModel imgs) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.amber,
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Image.network(imgs.url),
          ),
          Text(imgs.title),
        ],
      ),
    );
  }
}
