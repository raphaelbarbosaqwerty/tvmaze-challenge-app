import 'package:flutter/material.dart';

import '../../home_store.dart';

class SearchBarField extends StatelessWidget {
  final HomeStore store;
  
  const SearchBarField({
    Key key,
    @required this.searchField, this.store,
  }) : super(key: key);

  final FocusNode searchField;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelText: "TVMaze Series",
        labelStyle: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        hintText: "Search...",
        hintStyle: TextStyle(color: Colors.white54),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        border: InputBorder.none,
      ),
      focusNode: searchField,
      onChanged: (text) async {
        if(text.length > 3) {
          store.setSerieName(text);
          await store.searchSerie();
        } else if(text.length == 0) {
          store.setSerieName('');
          await store.fetchSeries();
        }
      },
    );
  }
}