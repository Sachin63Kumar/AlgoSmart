int linearSearch(List<int> list, int target) {
  for (var i = 0; i < list.length; i++) {
    if (list[i] == target) {
      return i;
    }
  }
  return -1;
}
