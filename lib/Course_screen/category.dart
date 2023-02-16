class Category {
  String thumbnail;
  String name;
  // int noOfCourses;

  Category({
    required this.name,
    // required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Searching And Sorting',
    // noOfCourses: 55,
    thumbnail: 'assets/Binary_search.png',
  ),
  // Category(
  //   name: 'Bubble Sort',
  //   noOfCourses: 20,
  //   thumbnail: 'assets/accounting.png',
  // ),
  // Category(
  //   name: 'Insertion Sort',
  //   noOfCourses: 16,
  //   thumbnail: 'assets/photography.png',
  // ),
  // Category(
  //   name: 'Product Design',
  //   noOfCourses: 25,
  //   thumbnail: 'assets/design.png',
  // ),
];
