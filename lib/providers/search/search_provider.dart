import '../../models/search_model.dart';
import '../base_provider.dart';
import 'package:flutter/material.dart';

abstract class SearchProvider extends BaseProvider {
  final List<SearchModel> numbers = [
    SearchModel(0),
    SearchModel(1),
    SearchModel(4),
    SearchModel(11),
    SearchModel(19),
    SearchModel(22),
    SearchModel(34),
    SearchModel(35),
    SearchModel(38),
    SearchModel(39),
    SearchModel(44),
    SearchModel(46),
    SearchModel(47),
    SearchModel(49),
    SearchModel(57),
    SearchModel(62),
    SearchModel(69),
    SearchModel(74),
  ];

  bool _isSearching = false;
  int _position = -2;

  bool get isSearching => _isSearching;
  int get position => _position;

  @mustCallSuper
  void search({int value = 34}) {
    reset();
    _isSearching = true;
  }

  @protected
  void reset() {
    _isSearching = false;
    _position = -2;
    for (var number in numbers) {
      number.reset();
    }
    notifyListeners();
  }

  @protected
  void potentialNode(int index) {
    numbers[index].potential();
    notifyListeners();
  }

  @protected
  void searchedNode(int index) {
    numbers[index].searched();
    notifyListeners();
  }

  @protected
  void discardNode(int index) {
    numbers[index].discard();
    notifyListeners();
  }

  @protected
  void discardNodes(int left, int right) {
    for (var index = left; index <= right; index++) {
      numbers[index].discard();
    }
    notifyListeners();
  }

  @protected
  void foundNode(int index) {
    _isSearching = false;
    numbers[index].found();
    _position = index;
    notifyListeners();
  }

  @protected
  void nodeNotFound() {
    _isSearching = false;
    _position = -1;
    notifyListeners();
  }
}
