import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class example_2 extends StatefulWidget {
  const example_2({Key? key}) : super(key: key);

  @override
  State<example_2> createState() => _example_2State();
}

class _example_2State extends State<example_2> {
  List<Photos> photosapi = [];
  Future<List<Photos>> getphotosapi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(title: i['title'], url: i['url']);
        photosapi.add(photos);
      }
      return photosapi;
    } else {
      return photosapi;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 45, 0.0, 0.0),
              child: Center(
                  child: Text(
                'Custom Models',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
            ),
            Expanded(
              child: FutureBuilder(
                  future: getphotosapi(),
                  builder: ((context, AsyncSnapshot<List<Photos>> snapshot) {
                    return ListView.builder(
                        itemCount: photosapi.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data![index].url.toString()),
                            ),
                            title: Text(snapshot.data![index].title.toString()),
                          );
                        });
                  })),
            )
          ],
        ),
      ),
    );
  }
}

class Photos {
  late String title, url;

  Photos({required this.title, required this.url});
}
