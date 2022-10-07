import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api/Models/Post_model.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<PostModel> postList = [];

  Future<List<PostModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('API INTEGRATION'))),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Loading ..');
                  } else {
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: ((context, index) {
                          return Card(
                            color: Color.fromARGB(255, 255, 197, 7),
                            child: Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Column(
                                children: [
                                  Text(
                                    'BODY',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    postList[index].title.toString(),
                                  )
                                ],
                              ),
                            ),
                          );
                        }));
                  }
                }),
          )
        ],
      ),
    );
  }
}
