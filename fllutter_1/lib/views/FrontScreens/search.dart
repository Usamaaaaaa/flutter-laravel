import 'package:fllutter_1/Widgets/search.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("Search"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          )
        ],
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text("items"),
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  fillColor: const Color(0xffc2c2c2),
                  filled: true,
                  hintText: "Search items",
                  suffixIcon: const Icon(Icons.search)),
            ),
          ),
          const SizedBox(height: 10),
          const SearchedItem(),
          const SearchedItem(),
          const SearchedItem(),
        ],
      ),
    );
  }
}
