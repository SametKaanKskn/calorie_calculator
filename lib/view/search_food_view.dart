import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final title = Text("Search Meal");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: title,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.orange)),
                  filled: true,
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 173, 161, 161)),
                  hintText: "Search",
                  fillColor: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
