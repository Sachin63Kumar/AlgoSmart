import 'package:flutter_complete_guide/providers/sort/sort_provider.dart';

import '../../models/sort_model.dart';

class BubbleSortProvider extends SortProvider {
  @override
  void sort() {
    super.sort();
    _startSort(numbers);
  }

  Future _startSort(List<SortModel> list) async {
    var sorted = false;
    var counter = 0;

    while (!sorted) {
      sorted = true;
      for (var i = 0; i < list.length - 1 - counter; i++) {
        markNodesForSorting(i, i + 1);
        render();
        if (list[i].value > list[i + 1].value) {
          await pause();
          final tmp = list[i];
          list[i] = list[i + 1];
          list[i + 1] = tmp;
          sorted = false;
          render();
        }
        await pause();
        markNodesAsNotSorted(0, i);
      }
      markNodeAsSorted(list.length - 1 - counter);
      counter++;
    }
    markNodesAsSorted(0, list.length - 1 - counter);
    setStateToSorted();
    render();
  }
}
