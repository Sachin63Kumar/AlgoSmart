import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/Own_linearSearch.dart';
import 'package:provider/provider.dart';

import 'providers/search/binary_search_provider.dart';
import 'providers/search/linear_search_provider.dart';
import 'providers/sort/bubble_sort_provider.dart';
import 'providers/sort/insertion_sort_provider.dart';
import 'providers/sort/quick_sort_provider.dart';
import 'providers/sort/selection_sort_provider.dart';
import 'ux/pages/home/home.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithms',
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      home: Scaffold(
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => LinearSearchProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => BinarySearchProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => BubbleSortProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => InsertionSortProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => QuickSortProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => SelectionSortProvider(),
            )
          ],
          child: Home(),
          // child: OwnLinearSearch(),
        ),
      ),
    );
  }
}
