import 'package:flutter/material.dart';

import '../../providers/search/search_provider.dart';
import '../widgets/search/search.dart';
import '../widgets/search/search_indicator.dart';
import '../widgets/search/search_message.dart';
import '../widgets/search/search_speed.dart';
import '../widgets/search/search_visualizer.dart';

class SearchPage<T extends SearchProvider> extends StatelessWidget {
  SearchPage({Key? key, required this.title})
      // ignore: unnecessary_null_comparison
      : assert(title != null),
        super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey(debugLabel: title);
    return SafeArea(
      child: Container(
        color: Color.fromARGB(255, 88, 111, 227),
        child: Stack(
          key: key,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    title,
                    // style: Theme.of(context).textTheme.headline4,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                //Below can not be constant
                Expanded(
                  child: SearchVisualizer<T>(),
                ),
                SearchMessage<T>(),
                const SizedBox(height: 24),
                SearchSpeed<T>(),
                Search<T>(),
                const SizedBox(height: 24),
              ],
            ),
            SearchIndicator<T>(
              parentKey: key,
            ),
          ],
        ),
      ),
    );
  }
}
