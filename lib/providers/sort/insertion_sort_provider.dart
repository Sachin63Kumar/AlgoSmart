import 'package:flutter_complete_guide/providers/sort/sort_provider.dart';

import '../../models/sort_model.dart';

class InsertionSortProvider extends SortProvider {
  @override
  void sort() {
    super.sort();
    _startSort(numbers);
  }

  Future _startSort(List<SortModel> list) async {
    for (var i = 0; i < list.length; i++) {
      if (i > 1) {
        markNodesAsNotSorted(0, i - 2);
      }
      for (var j = i; j > 0 && (list[j].value < list[j - 1].value); j--) {
        markNodesForSorting(j - 1, j);
        await pause();
        render();
        final tmp = list[j];
        list[j] = list[j - 1];
        list[j - 1] = tmp;
        await pause();
        render();
        markNodeAsNotSorted(j);
      }
    }
    markNodesAsSorted(0, list.length - 1);
    setStateToSorted();
  }
}
