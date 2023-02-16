import 'package:flutter/material.dart';

enum SearchState { open, discard, search, searched, found }

class SearchModel {
  SearchModel(this.value)
      : state = ValueNotifier(SearchState.open),
        color = Colors.white,
        key = GlobalKey();

  final int value;
  ValueNotifier<SearchState> state;
  Color color;
  GlobalKey key;

  void reset() {
    state.value = SearchState.open;
    color = Colors.white;
  }

  void potential() {
    state.value = SearchState.search;
    color = Color.fromARGB(255, 157, 248, 255);
  }

  void discard() {
    state.value = SearchState.discard;
    color = Color.fromARGB(255, 241, 147, 141);
  }

  void found() {
    state.value = SearchState.found;
    color = Color.fromARGB(255, 111, 255, 116);
  }

  void searched() {
    state.value = SearchState.searched;
  }
}
