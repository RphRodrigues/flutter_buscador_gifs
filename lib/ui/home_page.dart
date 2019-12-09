import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static String _search;
  static int _offset = 0;

  final _textController = TextEditingController();

  String _trendingRequest =
      "https://api.giphy.com/v1/gifs/trending?api_key=IdXowHWWFuzediCJROzuo9oWSBNFwjcq&limit=20&rating=G";
  String _searchRequest =
      "https://api.giphy.com/v1/gifs/search?api_key=IdXowHWWFuzediCJROzuo9oWSBNFwjcq&q=$_search&limit=20&offset=$_offset&rating=G&lang=en";

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null) {
      response = await http.get(_trendingRequest);
    } else {
      response = await http.get(_searchRequest);
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    _getGifs().then((map) {
      print(map);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  labelText: "Pesquise aqui!",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder()),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _getGifs(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 5.0,
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      return Container();
                    } else {
                      return _createGitTable(context, snapshot);
                    }
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _createGitTable(BuildContext context, AsyncSnapshot snapshot) {
    return Container();
  }
}
