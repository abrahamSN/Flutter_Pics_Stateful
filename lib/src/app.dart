// import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  int counter = 1;
  List<ImageModel> imgs = [];

  void fetchImage() async {
    counter++;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      imgs.add(imageModel);
    });
  }

  // Must define  a 'build' methid that returns
  // the widgets that *this* widget will show
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lets se some images!'),
        ),
        body: ImageList(imgs),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          tooltip: 'testing',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
