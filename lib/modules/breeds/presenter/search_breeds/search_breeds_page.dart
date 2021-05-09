import 'package:flutter/material.dart';

class SearchBreedsPage extends StatefulWidget {
  @override
  _SearchBreedsPageState createState() => _SearchBreedsPageState();
}

class _SearchBreedsPageState extends State<SearchBreedsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (_, id) {
              return ListTile();
            }),
          )
        ],
      ),
    );
  }
}
